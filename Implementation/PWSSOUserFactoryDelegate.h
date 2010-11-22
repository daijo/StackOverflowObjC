//
//  PWSSOUserFactoryDelegate.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PWSSOUserFactory;
@protocol PWSSODetailedUser;

@protocol PWSSOUserFactoryDelegate

-(void)userFactory:(PWSSOUserFactory *)userFactory gotUser:(id<PWSSODetailedUser>)user;
-(void)userFactoryFinished:(PWSSOUserFactory *)userFactory;
-(void)userFactory:(PWSSOUserFactory *)userFactory didFailWithError:(NSError *)error;

@end