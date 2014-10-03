//
//  WTFMenubarController.h
//  Internet?
//
//  Created by Martin, Christopher (ETW) on 9/26/14.
//  Copyright (c) 2014 Martin, Christopher (ETW). All rights reserved.
//

#import <Foundation/Foundation.h>
@class WTFStatusItemView;
@interface WTFMenubarController : NSObject

@property (nonatomic) BOOL hasActiveIcon;
@property (nonatomic, strong, readonly) NSStatusItem *statusItem;

@end
