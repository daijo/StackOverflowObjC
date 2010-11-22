//
//  PWSSOQuestionServiceImp.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOQuestionService.h"
#import "PWSSOQuestionImp.h"
#import "PWSSOQuestionFactoryDelegate.h"

@protocol PWSSOQuestionServiceDelegate;

@interface PWSSOQuestionServiceImp : NSObject <PWSSOQuestionService, PWSSOQuestionFactoryDelegate> {
	id<PWSSOQuestionServiceDelegate> delegate;
	BOOL running;
}

@property (retain) id<PWSSOQuestionServiceDelegate> delegate;
+(id) questionServiceWithDelegate:(id<PWSSOQuestionServiceDelegate>) delegate;

@end
