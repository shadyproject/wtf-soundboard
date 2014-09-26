//
//  WTFMenubarController.m
//  Internet?
//
//  Created by Martin, Christopher (ETW) on 9/26/14.
//  Copyright (c) 2014 Martin, Christopher (ETW). All rights reserved.
//

#import "WTFMenubarController.h"
#import "WTFStatusItemView.h"

@interface WTFMenubarController ()
@property (nonatomic, strong) WTFStatusItemView *statusItemView;

@end

@implementation WTFMenubarController

-(id)init {
    self = [super init];
    if (self) {
        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:24.0];
        
        _statusItemView = [[WTFStatusItemView alloc] initWithStatusItem:statusItem];
        _statusItemView.image = [NSImage imageNamed:@"AppIcon"];
        _statusItemView.alternateImage = [NSImage imageNamed:@"AppIcon"];
        _statusItemView.target = @selector(toggleMenu:);
        
    }
    
    return self;
}

- (void)dealloc {
    [[NSStatusBar systemStatusBar] removeStatusItem:self.statusItem];
}

#pragma mark -
#pragma mark Public accessors

- (NSStatusItem *)statusItem
{
    return self.statusItemView.statusItem;
}

#pragma mark -

- (BOOL)hasActiveIcon
{
    return self.statusItemView.isHighlighted;
}

- (void)setHasActiveIcon:(BOOL)flag
{
    self.statusItemView.isHighlighted = flag;
}

@end
