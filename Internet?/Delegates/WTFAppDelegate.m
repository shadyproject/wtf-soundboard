//
//  WTFAppDelegate.m
//  Internet?
//
//  Created by Martin, Christopher (ETW) on 7/11/14.
//  Copyright (c) 2014 Martin, Christopher (ETW). All rights reserved.
//

#import "WTFAppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "WTFMenubarController.h"

@interface WTFAppDelegate ()

@end

@implementation WTFAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    //install our icon into the menu bar
    self.menubarController = [[WTFMenubarController alloc] init];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
    //explicitly remove icon from the bar
    self.menubarController = nil;
    return NSTerminateNow;
}

@end
