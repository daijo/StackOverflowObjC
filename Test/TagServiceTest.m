//
//  TagServiceTest.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "TagServiceTest.h"
#import "PWSSOServiceFactory.h"
#import "PWSSOBaseFactory.h"
#import "PWSSOTag.h"

@implementation TagServiceTest

@synthesize testCaseLock, response, tagCount, testCase, testCaseTime, doneWithErrors,
done, receivedError;

-(void)initTestCase:(NSString *)name {
	
	[PWSSOBaseFactory setServerAddress:[NSString stringWithFormat:@"file://%@/TestData", SRCROOT]];
	[PWSSOBaseFactory setQueryOperator:@""];
	
	self.testCase = name;
	self.testCaseLock = YES;
	self.testCaseTime = 0;
	self.tagCount = 0;
	self.done = NO;
	self.doneWithErrors = NO;
	self.receivedError = nil;
}

-(void)testGetNonExistantTagByFilter {
	
	[self initTestCase:NSStringFromSelector(_cmd)];
	
	[[[PWSSOServiceFactory tagServiceWithDelegate:self] retain] getTagsByFilter:@"hejhopp"];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
		 runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail with errors was sent");
	STAssertTrue(self.tagCount == 0, @"Did receive a tag");
	STAssertTrue(self.done, @"Done wasn't sent");
}

-(void)testGetTagByFilter {
	
	[self initTestCase:NSStringFromSelector(_cmd)];
	
	[[[PWSSOServiceFactory tagServiceWithDelegate:self] retain] getTagsByFilter:@"ob"];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
		 runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail was sent");
	STAssertTrue(self.tagCount == 4, @"Did receive more or less then 4 tags");
	STAssertTrue(self.done, @"Done wasn't sent");
}

-(void)tagService:(id<PWSSOTagService>)tagService gotTag:(id<PWSSOTag>)tag {
	
	if ([self.testCase isEqualToString:@"testGetTagByFilter"]) {
		
		switch (self.tagCount) {
			case 0:
				// Name
				STAssertEqualObjects(tag.name, @"objective-c",
									 @"Name doesn't match", nil);
				// Count
				STAssertEqualObjects(tag.count, [NSNumber numberWithInt:4],
									 @"Count doesn't match", nil);
				// Fulfills required
				STAssertTrue(tag.fulfillsRequired == NO, @"Fulfills required doesn't match");
				
				break;
			case 1:
				// Name
				STAssertEqualObjects(tag.name, @"mobile",
									 @"Name doesn't match", nil);
				// Count
				STAssertEqualObjects(tag.count, [NSNumber numberWithInt:1],
									 @"Count doesn't match", nil);
				// Fulfills required
				STAssertTrue(tag.fulfillsRequired == NO, @"Fulfills required doesn't match");
				
				break;
			case 2:
				// Name
				STAssertEqualObjects(tag.name, @"obsolete",
									 @"Name doesn't match", nil);
				// Count
				STAssertEqualObjects(tag.count, [NSNumber numberWithInt:1],
									 @"Count doesn't match", nil);
				// Fulfills required
				STAssertTrue(tag.fulfillsRequired == YES, @"Fulfills required doesn't match");
				
				break;
			case 3:
				// Name
				STAssertEqualObjects(tag.name, @"robot",
									 @"Name doesn't match", nil);
				// Count
				STAssertEqualObjects(tag.count, [NSNumber numberWithInt:1],
									 @"Count doesn't match", nil);
				// Fulfills required
				STAssertTrue(tag.fulfillsRequired == NO, @"Fulfills required doesn't match");
				
				break;
				
			default:
				break;
		}
	}
	
	self.tagCount++;
	
	[tag release];
}

-(void)tagServiceFinished:(id<PWSSOTagService>)tagService {
	
	self.testCaseLock = NO;
	self.done = YES;
	
	[tagService release];
}

-(void)tagService:(id<PWSSOTagService>)tagService didFailWithError:(NSError *)error {
	
	NSLog(error.description);
	
	self.testCaseLock = NO;
	self.doneWithErrors = YES;
	self.receivedError = error;
	
	[tagService release];
}

@end
