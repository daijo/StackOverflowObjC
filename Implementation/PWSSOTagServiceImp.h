//
//  PWSSOTagServiceImp.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOTagService.h"
#import "PWSSOTagImp.h"
#import "PWSSOTagFactoryDelegate.h"

@protocol PWSSOTagServiceDelegate;

@interface PWSSOTagServiceImp : NSObject <PWSSOTagService, PWSSOTagFactoryDelegate> {
	id<PWSSOTagServiceDelegate> delegate;
	BOOL running;
}

@property (retain) id<PWSSOTagServiceDelegate> delegate;
+(id) tagServiceWithDelegate:(id<PWSSOTagServiceDelegate>) delegate;

@end
