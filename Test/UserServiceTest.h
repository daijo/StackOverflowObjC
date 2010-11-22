//
//  UserServiceTest.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/8/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "PWSSOUserServiceDelegate.h"

@interface UserServiceTest : SenTestCase <PWSSOUserServiceDelegate>  {
	BOOL testCaseLock;
	BOOL response;
	NSInteger userCount;
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
@property (assign) NSInteger userCount;
@property (assign) NSInteger testCaseTime;
@property (copy) NSString *testCase;
@property (copy) NSError *receivedError;

-(void)testGetNonExistantUserById;
-(void)testGetUserById;

@end
