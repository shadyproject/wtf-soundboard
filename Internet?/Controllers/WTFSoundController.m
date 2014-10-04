//
//  WTFSoundController.m
//  Internet?
//
//  Created by Christopher Martin on 10/3/14.
//  Copyright (c) 2014 Martin, Christopher (ETW). All rights reserved.
//

#import "WTFSoundController.h"
#import <AVFoundation/AVFoundation.h>

@interface WTFSoundController ()
@property (nonatomic, strong) AVAudioPlayer *wtfPlayer;
@property (nonatomic, strong) AVAudioPlayer *lickerPlayer;
@property (nonatomic, strong) AVAudioPlayer *eatPlayer;
@end

@implementation WTFSoundController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"wtf-internet" ofType:@"m4a"];
        NSURL *url = [NSURL fileURLWithPath:path];
        _wtfPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        path = [[NSBundle mainBundle] pathForResource:@"lickers" ofType:@"m4a"];
        url = [NSURL fileURLWithPath:path];
        _lickerPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        path = [[NSBundle mainBundle] pathForResource:@"eat" ofType:@"m4a"];
        url = [NSURL fileURLWithPath:path];
        _eatPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    
    return self;
}

- (void)playEat {
    [self.eatPlayer play];
}

- (void)playWhat {
    [self.wtfPlayer play];
}

- (void)playYou {
    [self.lickerPlayer play];
}
@end
