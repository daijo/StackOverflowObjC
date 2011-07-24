//
//  UserServiceTest.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/8/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "UserServiceTest.h"
#import "PWSSOUserService.h"
#import "PWSSOServiceFactory.h"
#import "PWSSOBaseFactory.h"
#import "PWSSODetailedUser.h"


@implementation UserServiceTest

@synthesize testCaseLock, response, userCount, testCase, testCaseTime, doneWithErrors,
done, receivedError;

-(void)initTestCase:(NSString *)name {
	
	[PWSSOBaseFactory setServerAddress:[NSString stringWithFormat:@"file://%@/TestData", SRCROOT]];
	[PWSSOBaseFactory setQueryOperator:@""];
	
	self.testCase = name;
	self.testCaseLock = YES;
	self.testCaseTime = 0;
	self.userCount = 0;
	self.done = NO;
	self.doneWithErrors = NO;
	self.receivedError = nil;
}

-(void)testGetNonExistantUserById {
	
	[self initTestCase:NSStringFromSelector(_cmd)];
	
	[[[PWSSOServiceFactory userServiceWithDelegate:self] retain] getUserById:[NSNumber numberWithInt:666]];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
		 runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertTrue(self.doneWithErrors, @"Fail with errors wasn't sent");
	STAssertTrue(self.userCount == 0, @"Did receive a user");
	STAssertFalse(self.done, @"Done was sent");
}

-(void)testGetUserById {
	[self initTestCase:NSStringFromSelector(_cmd)];
	
	[[[PWSSOServiceFactory userServiceWithDelegate:self] retain] getUserById:[NSNumber numberWithInt:320]];
	
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
	STAssertTrue(self.userCount == 1, @"Did receive more or less then one user");
	STAssertTrue(self.done, @"Done wasn't sent");
}

-(void)testGetNonExistantUsersByDisplayName {
	[self initTestCase:NSStringFromSelector(_cmd)];
	
	[[[PWSSOServiceFactory userServiceWithDelegate:self] retain] getUsersByDisplayName:@"olabolapellajonsa"];
	
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
	STAssertTrue(self.userCount == 0, @"Did receive more or less then one user");
	STAssertTrue(self.done, @"Done wasn't sent");
}

-(void)testGetUsersByDisplayName {
	[self initTestCase:NSStringFromSelector(_cmd)];
	
	[[[PWSSOServiceFactory userServiceWithDelegate:self] retain] getUsersByDisplayName:@"dai"];
	
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
	STAssertTrue(self.userCount == 3, @"Did receive more or less then one user");
	STAssertTrue(self.done, @"Done wasn't sent");
}

-(void)userService:(id<PWSSOUserService>)userService gotUser:(id<PWSSODetailedUser>)user {
	
	if ([self.testCase isEqualToString:@"testGetUserById"]) {
		
		switch (self.userCount) {
			case 0:
				// ID
				STAssertEqualObjects(user.ID, [NSNumber numberWithInt:320],
									 @"ID doesn't match", nil);
				// userType
				STAssertEqualObjects(user.userType, @"registered",
									 @"User type doesn't match", nil);				
				// displayName
				STAssertEqualObjects(user.displayName, @"Mark Harrison",
									 @"Display name doesn't match", nil);
				
				// reputation
				STAssertEqualObjects(user.reputation, [NSNumber numberWithInt:2101],
									 @"Reputation doesn't match", nil);			
				
				// emailHash
				STAssertEqualObjects(user.emailHash, @"f79b395a801bf291b74e8bccea8e03f8",
									 @"Email hash doesn't match", nil);	
				
				// creationDate
				STAssertEqualObjects(user.creationDate, [NSDate dateWithTimeIntervalSince1970:1274425911],
									 @"Creation date doesn't match", nil);	
				
				// age
				STAssertEqualObjects(user.age, [NSNumber numberWithInt:48],
									 @"Age doesn't match", nil);	
				
				// lastAccessDate
				STAssertEqualObjects(user.lastAccessDate, [NSDate dateWithTimeIntervalSince1970:1286864029],
									 @"Last access date doesn't match", nil);
				
				// websiteUrl
				STAssertEqualObjects(user.websiteUrl, [NSURL URLWithString:@"http://markharrison.net"],
									 @"Url doesn't match", nil);
				
				// location
				STAssertEqualObjects(user.location, @"Piedmont, California",
									 @"Location doesn't match", nil);
				
				// about
				STAssertEqualObjects(user.about, @"Since moving to the Bay Area in 2001 I have been working at Pixar.  Prior to that I lived in China and was the Chief Software Architect at AsiaInfo, the company that built China's internet.  I studied computer science and worked in Texas for many years.\r\n<p><p>\r\nfeel free to drop me a line if you've got any feedback on stuff I've posted here:<p><p>mh@pixar.com\r\n",
									 @"About doesn't match", nil);
				
				// questionCount
				STAssertEqualObjects(user.questionCount, [NSNumber numberWithInt:0],
									 @"Question count  doesn't match", nil);
				
				// answerCount
				STAssertEqualObjects(user.answerCount, [NSNumber numberWithInt:0],
									 @"Answer count  doesn't match", nil);
				
				// viewCount
				STAssertEqualObjects(user.viewCount, [NSNumber numberWithInt:5],
									 @"View count  doesn't match", nil);
				
				// upVoteCount
				STAssertEqualObjects(user.upVoteCount, [NSNumber numberWithInt:0],
									 @"Up vote count  doesn't match", nil);
				
				// downVoteCount
				STAssertEqualObjects(user.downVoteCount, [NSNumber numberWithInt:0],
									 @"Down vote count  doesn't match", nil);
				
				// associationID
				STAssertEqualObjects(user.associationID, @"b4a1e151-3ff7-48b1-977c-c94ff4af7901",
									 @"Association ID doesn't match", nil);
				
				// questionsUrl
				STAssertEqualObjects(user.questionsUrl, [NSURL URLWithString:@"/users/320/questions"],
									 @"Url doesn't match", nil);
				
				// answersUrl
				STAssertEqualObjects(user.answersUrl, [NSURL URLWithString:@"/users/320/answers"],
									 @"Url doesn't match", nil);
				
				// favoritesUrl
				STAssertEqualObjects(user.favoritesUrl, [NSURL URLWithString:@"/users/320/favorites"],
									 @"Url doesn't match", nil);
				
				// tagsUrl
				STAssertEqualObjects(user.tagsUrl, [NSURL URLWithString:@"/users/320/tags"],
									 @"Url doesn't match", nil);
				
				// badgesUrl
				STAssertEqualObjects(user.badgesUrl, [NSURL URLWithString:@"/users/320/badges"],
									 @"Url doesn't match", nil);
				
			    // timelineUrl
				STAssertEqualObjects(user.timelineUrl, [NSURL URLWithString:@"/users/320/timeline"],
									 @"Url doesn't match", nil);
				
				// mentionedUrl
				STAssertEqualObjects(user.mentionedUrl, [NSURL URLWithString:@"/users/320/mentioned"],
									 @"Url doesn't match", nil);
				
				// commentsUrl
				STAssertEqualObjects(user.commentsUrl, [NSURL URLWithString:@"/users/320/comments"],
									 @"Url doesn't match", nil);
				
				// reputationUrl
				STAssertEqualObjects(user.reputationUrl, [NSURL URLWithString:@"/users/320/reputation"],
									 @"Url doesn't match", nil);
				
				// goldBadgeCount
				STAssertEqualObjects(user.goldBadgeCount, [NSNumber numberWithInt:0],
									 @"Badge count doesn't match", nil);
				
				// silverBadgeCount
				STAssertEqualObjects(user.silverBadgeCount, [NSNumber numberWithInt:1],
									 @"Badge count  doesn't match", nil);
				
				// bronzeBadgeCount
				STAssertEqualObjects(user.bronzeBadgeCount, [NSNumber numberWithInt:1],
									 @"Badge count  doesn't match", nil);
				
				break;
				
			default:
				STFail(@"Unexpected user");
				
				break;
		}
	} else if ([self.testCase isEqualToString:@"testGetNonExistantUsersByDisplayName"]) {
		STFail(@"Got a user!!!");
	} else if ([self.testCase isEqualToString:@"testGetUsersByDisplayName"]) {
		
		switch (self.userCount) {
			case 0:
				// ID
				STAssertEqualObjects(user.ID, [NSNumber numberWithInt:563],
									 @"ID doesn't match", nil);
				
				break;
				
			case 1:
				// ID
				STAssertEqualObjects(user.ID, [NSNumber numberWithInt:1755],
									 @"ID doesn't match", nil);
				
				break;
				
			case 2:
				// ID
				STAssertEqualObjects(user.ID, [NSNumber numberWithInt:2556],
									 @"ID doesn't match", nil);
				
				break;
				
			default:
				STFail(@"Unexpected user");
				
				break;
		}
	}

	self.userCount++;
}

-(void)userServiceFinished:(id<PWSSOUserService>)userService {
	
	self.testCaseLock = NO;
	self.done = YES;
	
	[userService release];
}

-(void)userService:(id<PWSSOUserService>)userService didFailWithError:(NSError *)error {
	
	self.testCaseLock = NO;
	self.doneWithErrors = YES;
	self.receivedError = error;
	
	[userService release];
}

@end
