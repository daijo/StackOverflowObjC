//
//  PWSSOBasicUser.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/15/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PWSSOUser <NSObject>

@property (copy) NSNumber *ID;
@property (copy) NSString *userType;
@property (copy) NSString *displayName;
@property (copy) NSNumber *reputation;
@property (copy) NSString *emailHash;

@end
