//
//  PWSSOServiceFactory.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/12/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PWSSOQuestionService;
@protocol PWSSOQuestionServiceDelegate;
@protocol PWSSOUserService;
@protocol PWSSOUserServiceDelegate;
@protocol PWSSOTagService;
@protocol PWSSOTagServiceDelegate;

@interface PWSSOServiceFactory : NSObject {
}
+(id<PWSSOQuestionService>) questionServiceWithDelegate:(id<PWSSOQuestionServiceDelegate>) delegate;
+(id<PWSSOUserService>) userServiceWithDelegate:(id<PWSSOUserServiceDelegate>) delegate;
+(id<PWSSOTagService>) tagServiceWithDelegate:(id<PWSSOTagServiceDelegate>) delegate;
@end
