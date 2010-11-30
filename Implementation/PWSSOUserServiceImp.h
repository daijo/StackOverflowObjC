//
//  PWSSOUserServiceImp.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOUserService.h"
#import "PWSSODetailedUserImp.h"
#import "PWSSOUserFactoryDelegate.h"

@protocol PWSSOUserServiceDelegate;

@interface PWSSOUserServiceImp : NSObject <PWSSOUserService, PWSSOUserFactoryDelegate>{
	id<PWSSOUserServiceDelegate> delegate;
	BOOL running;
}

@property (retain) id<PWSSOUserServiceDelegate> delegate;
+(id) userServiceWithDelegate:(id<PWSSOUserServiceDelegate>) delegate;

@end