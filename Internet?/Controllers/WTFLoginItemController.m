//
//  WTFLoginItemController.m
//  Internet?
//
//  Created by Christopher Martin on 10/17/14.
//  Copyright (c) 2014 Martin, Christopher (ETW). All rights reserved.
//

#import "WTFLoginItemController.h"

static NSString* const LaunchAtLoginKey = @"launchAtLogin";

@interface WTFLoginItemController ()
@property (assign) LSSharedFileListRef loginItems;
@end

@implementation WTFLoginItemController

void sharedFileListDidChange(LSSharedFileListRef inList, void *context) {
    WTFLoginItemController *self = (__bridge id) context;
    [self willChangeValueForKey:LaunchAtLoginKey];
    [self didChangeValueForKey:LaunchAtLoginKey];
}

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _loginItems = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
        LSSharedFileListAddObserver(_loginItems, CFRunLoopGetMain(), (CFStringRef)NSDefaultRunLoopMode,
                                    sharedFileListDidChange, (__bridge void *)(self));
    }
    
    return self;
}

-(void)dealloc {
    LSSharedFileListRemoveObserver(_loginItems, CFRunLoopGetMain(), (CFStringRef)NSDefaultRunLoopMode,
                                   sharedFileListDidChange, (__bridge void*)self);
    CFRelease(_loginItems);
}

-(LSSharedFileListItemRef)findItemWithURL:(NSURL*)wantedURL inFileList: (LSSharedFileListRef)fileList {
    if (wantedURL == NULL || fileList == NULL) {
        return NULL;
    }
    
    NSArray *listSnapshot = CFBridgingRelease(LSSharedFileListCopySnapshot(fileList, NULL));
    
    for (id itemObject in listSnapshot) {
        LSSharedFileListItemRef item = (__bridge LSSharedFileListItemRef)itemObject;
        
        UInt32 resolutionFlags = kLSSharedFileListNoUserInteraction | kLSSharedFileListDoNotMountVolumes;
        CFURLRef currentItemUrl = NULL;
        LSSharedFileListItemResolve(item, resolutionFlags, &currentItemUrl, NULL);
        
        if (currentItemUrl && CFEqual(currentItemUrl, (__bridge CFTypeRef)(wantedURL))) {
            CFRelease(currentItemUrl);
            return item;
        }
    }
    
    return NULL;
}

-(BOOL)itemWillLaunchAtLogin:(NSURL*)itemUrl {
    return !![self findItemWithURL:itemUrl inFileList:_loginItems];
}

-(void)setLaunchAtLoginForUrl:(NSURL*)url andEnable:(BOOL)enabled {
    LSSharedFileListItemRef appItem = [self findItemWithURL:url inFileList:_loginItems];
    
    if (enabled && !appItem) {
        LSSharedFileListInsertItemURL(_loginItems, kLSSharedFileListItemBeforeFirst, NULL, NULL, (__bridge CFURLRef)url, NULL, NULL);
    } else if (!enabled && appItem) {
        LSSharedFileListItemRemove(_loginItems, appItem);
    }
}

-(NSURL*)appUrl {
    return [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
}

-(BOOL)launchAtLogin {
    return [self itemWillLaunchAtLogin:[self appUrl]];
}

@end
