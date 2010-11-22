//
//  PWSSOUnansweredQuestionsByTagsFactory.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/21/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOQuestionServiceDelegate.h"
#import "PWSSOQuestionFactoryDelegate.h"
#import "PWSSOQuestionFactory.h"

@interface PWSSOUnansweredQuestionsByTagsFactory : PWSSOQuestionFactory {

}

+(id)questionFactoryWithDelegate:(id<PWSSOQuestionFactoryDelegate>) delegate;
-(void)getUnansweredQuestionsByTags:(NSArray *)tags;

@end
