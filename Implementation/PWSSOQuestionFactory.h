//
//  PWSSOQuestionFactory.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOBaseFactory.h"
#import "PWSSOQuestionImp.h"
#import "PWSSOUserImp.h"

@protocol PWSSOQuestionFactoryDelegate;

@interface PWSSOQuestionFactory : PWSSOBaseFactory  <YAJLParserDelegate> {
	id<PWSSOQuestionFactoryDelegate> delegate;
	NSString* currentKey;
	PWSSOQuestionImp* question;
	int dictionaryLevel;
	int arrayLevel;
	BOOL parsingQuestions;
}

@property (retain) id<PWSSOQuestionFactoryDelegate> delegate;
@property (retain) PWSSOQuestionImp* question;
@property (retain) NSString* currentKey;

-(id) initWithDelegate:(id<PWSSOQuestionFactoryDelegate>) newDelegate;

@end
