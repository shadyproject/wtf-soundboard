//
//  WTFLoginItemController.h
//  Internet?
//
//  Created by Christopher Martin on 10/17/14.
//  Copyright (c) 2014 Martin, Christopher (ETW). All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const LaunchAtLoginKeyPath;

@interface WTFLoginItemController : NSObject

-(void)addAppToLoginItems;
-(void)removeAppFromLoginItems;

-(BOOL)appExistsAsLoginItem;

@end
