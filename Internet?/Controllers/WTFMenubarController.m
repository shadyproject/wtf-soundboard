//
//  WTFMenubarController.m
//  Internet?
//
//  Created by Martin, Christopher (ETW) on 9/26/14.
//  Copyright (c) 2014 Martin, Christopher (ETW). All rights reserved.
//

#import "WTFMenubarController.h"
#import "WTFSoundController.h"

@interface WTFMenubarController ()
@property (nonatomic, strong) WTFSoundController *soundController;
@end

@implementation WTFMenubarController

-(id)init {
    self = [super init];
    if (self) {
        _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:24.0];
        _statusItem.image = [NSImage imageNamed:@"AppIcon"];
        _statusItem.highlightMode = YES;

        NSMenu *menu = [[NSMenu alloc] init];
        [[menu addItemWithTitle:@"Internet?" action:@selector(playInternet:) keyEquivalent:@""] setTarget:self];
        [[menu addItemWithTitle:@"You are the ones" action:@selector(playYouAre:) keyEquivalent:@""] setTarget:self];
        [[menu addItemWithTitle:@"Eat" action:@selector(playEat:) keyEquivalent:@""] setTarget:self];
        [menu addItem:[NSMenuItem separatorItem]];
        //[[menu addItemWithTitle:@"Window" action:@selector(openWindow:) keyEquivalent:@""] setTarget:self];
        [[menu addItemWithTitle:@"Quit" action:@selector(quit:) keyEquivalent:@""] setTarget:self];

        _statusItem.menu = menu;
        
        _soundController = [[WTFSoundController alloc] init];
    }
    
    return self;
}

#pragma mark Menu Actions
- (void)playInternet:(id)sender {
    [self.soundController playWhat];
}

- (void)playYouAre:(id)sender {
    [self.soundController playYou];
}

- (void)playEat:(id)sender {
    [self.soundController playEat];
}

- (void)openWindow:(id)sender {
    NSLog(@"Show the window with the buttons");
}

- (void)quit:(id)sender {
    [[NSApplication sharedApplication] terminate:sender];
}

- (void)dealloc {
    [[NSStatusBar systemStatusBar] removeStatusItem:self.statusItem];
}

@end
