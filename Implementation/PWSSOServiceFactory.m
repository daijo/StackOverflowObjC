//
//  PWSSOServiceFactory.m
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOServiceFactory.h"
#import "PWSSOQuestionServiceImp.h"
#import "PWSSOUserServiceImp.h"
#import "PWSSOTagServiceImp.h"

@implementation PWSSOServiceFactory

+(id<PWSSOQuestionService>) questionServiceWithDelegate:(id<PWSSOQuestionServiceDelegate>) delegate {
	return [PWSSOQuestionServiceImp questionServiceWithDelegate:delegate];
}

+(id<PWSSOUserService>) userServiceWithDelegate:(id<PWSSOUserServiceDelegate>) delegate {
	return [PWSSOUserServiceImp userServiceWithDelegate:delegate];
}

+(id<PWSSOTagService>) tagServiceWithDelegate:(id<PWSSOTagServiceDelegate>) delegate {
	return [PWSSOTagServiceImp tagServiceWithDelegate:delegate];
}

@end
