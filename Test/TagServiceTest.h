//
//  TagServiceTest.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "PWSSOTagServiceDelegate.h"


@interface TagServiceTest : SenTestCase <PWSSOTagServiceDelegate>  {
	BOOL testCaseLock;
	BOOL response;
	NSInteger tagCount;
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
@property (assign) NSInteger tagCount;
@property (assign) NSInteger testCaseTime;
@property (copy) NSString *testCase;
@property (copy) NSError *receivedError;

-(void)testGetNonExistantTagByFilter;
-(void)testGetTagByFilter;

@end
