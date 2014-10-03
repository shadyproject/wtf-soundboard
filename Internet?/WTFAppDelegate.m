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
@property (nonatomic, strong) AVAudioPlayer *wtfPlayer;
@property (nonatomic, strong) AVAudioPlayer *lickerPlayer;
@property (nonatomic, strong) AVAudioPlayer *eatPlayer;
@end

@implementation WTFAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    //install our icon into the menu bar
    self.menubarController = [[WTFMenubarController alloc] init];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"wtf-internet" ofType:@"m4a"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.wtfPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    path = [[NSBundle mainBundle] pathForResource:@"lickers" ofType:@"m4a"];
    url = [NSURL fileURLWithPath:path];
    self.lickerPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    path = [[NSBundle mainBundle] pathForResource:@"eat" ofType:@"m4a"];
    url = [NSURL fileURLWithPath:path];
    self.eatPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
    //explicitly remove icon from the bar
    self.menubarController = nil;
    return NSTerminateNow;
}

- (IBAction)playClip:(id)sender {
    [sender setEnabled:NO];
    [self.wtfPlayer play];
    [sender setEnabled:YES];
}

- (IBAction)playLickerClip:(id)sender {
    [sender setEnabled:NO];
    [self.lickerPlayer play];
    [sender setEnabled:YES];
}

- (IBAction)playEatClip:(id)sender {
    [sender setEnabled:NO];
    [self.eatPlayer play];
    [sender setEnabled:YES];
}

@end
