//
//  PWSSOUserServiceDelegate.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PWSSOUserService;
@protocol PWSSODetailedUser;

@protocol PWSSOUserServiceDelegate

-(void)userService:(id<PWSSOUserService>)userService gotUser:(id<PWSSODetailedUser>)user;
-(void)userServiceFinished:(id<PWSSOUserService>)userService;
-(void)userService:(id<PWSSOUserService>)userService didFailWithError:(NSError *)error;

@end