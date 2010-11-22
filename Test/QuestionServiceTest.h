//
//  SearchQuestionTest.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 10/31/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.

#import <SenTestingKit/SenTestingKit.h>
#import "PWSSOQuestionServiceDelegate.h"

@interface QuestionServiceTest : SenTestCase <PWSSOQuestionServiceDelegate> {
	BOOL testCaseLock;
	BOOL response;
	NSInteger searchCount;
	NSInteger testCaseTime;
	NSString *testCase;
	BOOL done;
	BOOL doneWithErrors;
	NSError *receivedError;
}

@property (assign) BOOL testCaseLock;
@property (assign) BOOL doneWithErrors;
@property (assign) BOOL done;
@property (assign) BOOL response;
@property (assign) NSInteger searchCount;
@property (assign) NSInteger testCaseTime;
@property (copy) NSString *testCase;
@property (copy) NSError *receivedError;

-(void)testSearchQuestion1;
-(void)testSearchQuestion2;

@end
