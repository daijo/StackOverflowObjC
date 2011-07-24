//
//  SearchQuestionTest.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 10/31/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "QuestionServiceTest.h"
#import "PWSSOServiceFactory.h"
#import "PWSSOBaseFactory.h"
#import "PWSSOQuestionService.h"
#import "PWSSOQuestion.h"

@implementation QuestionServiceTest

@synthesize testCaseLock, response, searchCount, testCase, testCaseTime, doneWithErrors,
done, receivedError;

-(void)initTestCase:(NSString *)name {
	
	[PWSSOBaseFactory setServerAddress:[NSString stringWithFormat:@"file://%@/TestData", SRCROOT]];
	[PWSSOBaseFactory setQueryOperator:@""];
	[PWSSOBaseFactory setArrayDelimiter:@""];
	[PWSSOBaseFactory setQuotation:@""];
	
	self.testCase = name;
	self.testCaseLock = YES;
	self.testCaseTime = 0;
	self.searchCount = 0;
	self.done = NO;
	self.doneWithErrors = NO;
	self.receivedError = nil;
}

// Result with 15 questions
-(void)testSearchQuestion1 {
	
	[self initTestCase:NSStringFromSelector(_cmd)];

	[[[PWSSOServiceFactory questionServiceWithDelegate:self] retain] getQuestionsByTitle:@"java"];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
		 runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail with errors sent");
	if(self.receivedError != nil) {
		STFail([self.receivedError description]);
	}
	STAssertTrue(self.searchCount == 15, @"Didn't receive 15 questions");
	STAssertTrue(self.done, @"Done not sent");
}

// Handle NSURLRequest fail (non existent file)
-(void)testSearchQuestion2 {
	
	[self initTestCase:NSStringFromSelector(_cmd)];
	
	[[[PWSSOServiceFactory questionServiceWithDelegate:self] retain] getQuestionsByTitle:@"doesntExist"];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
		 runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertTrue(self.doneWithErrors, @"Fail with errors sent");
	STAssertTrue(self.searchCount == 0, @"Did receive question(s)");
	STAssertFalse(self.done, @"Done sent");
}

// Result with 2 unanswered questions
-(void)testUnansweredQuestions {
	NSArray *tags = [[NSArray arrayWithObjects:@"objective-c", @"cocoa", nil] retain];
	[tags autorelease];
	
	[self initTestCase:NSStringFromSelector(_cmd)];
	
	[[[PWSSOServiceFactory questionServiceWithDelegate:self] retain] getUnansweredQuestionsByTags:tags];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
		 runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail with errors sent");
	if(self.receivedError != nil) {
		STFail([self.receivedError description]);
	}
	STAssertTrue(self.searchCount == 2, @"Didn't receive 2 questions");
	STAssertTrue(self.done, @"Done not sent");
}

-(void)questionService:(id<PWSSOQuestionService>)questionService gotQuestion:(id<PWSSOQuestion>)question {

	if ([self.testCase isEqualToString:@"testSearchQuestion1"]) {
		
		switch (self.searchCount) {
			case 0:
				// title
				STAssertEqualObjects(question.title, @"Soapi.JS2 : a fully relational JavaScript client library for the Stack Exchange API - beta preview",
									 @"Title doesn't match", nil);
				
				break;
				
			case 1:
				// questionTimeline
				STAssertEqualObjects(question.questionTimeline, [NSURL URLWithString:@"/questions/518/timeline"], @"Url doesn't match", nil);
				
				break;

			case 2:
				// questionComments
				STAssertEqualObjects(question.questionComments, [NSURL URLWithString:@"/questions/494/comments"], @"Url doesn't match", nil);
				
				break;
				
			case 3:
				// questionAnswers;
				STAssertEqualObjects(question.questionAnswers, [NSURL URLWithString:@"/questions/891/answers"], @"Url doesn't match", nil);

				break;
				
			case 4:
				// creationDate;
				STAssertEqualObjects(question.creationDate, [NSDate dateWithTimeIntervalSince1970:1275964939], @"Date doesn't match ", nil);
				
				break;
				
			case 5:
				// lastEditDate;
				STAssertEqualObjects(question.lastEditDate, [NSDate dateWithTimeIntervalSince1970:1280319473], @"Date doesn't match ", nil);
				
				break;
				
			case 6:
				// lastActivityDate;
				STAssertEqualObjects(question.lastActivityDate, [NSDate dateWithTimeIntervalSince1970:1279367099], @"Date doesn't match ", nil);
				
				break;
			case 7:
				// ID;
				STAssertEqualObjects(question.ID, [NSNumber numberWithInt:541], @"ID doesn't match", nil);
				
				break;
				
			case 8:
				// answerCount;
				STAssertEqualObjects(question.answerCount, [NSNumber numberWithInt:0], @"Count doesn't match", nil);
				
				break;
				
				
			case 9:
				// favoriteCount;
				STAssertEqualObjects(question.favoriteCount, [NSNumber numberWithInt:6], @"Count doesn't match", nil);
				
				break;
				
			case 10:
				// upVoteCount;
				STAssertEqualObjects(question.upVoteCount, [NSNumber numberWithInt:0], @"Count doesn't match", nil);
				
				break;
				
			case 11:
				// downVoteCount;
				STAssertEqualObjects(question.downVoteCount, [NSNumber numberWithInt:0], @"Count doesn't match", nil);
				
				break;
				
			case 12:
				// viewCount;
				STAssertEqualObjects(question.viewCount, [NSNumber numberWithInt:221], @"Count doesn't match", nil);
				
				break;
				
			case 13:
				// score;
				STAssertEqualObjects(question.score, [NSNumber numberWithInt:4], @"Score doesn't match", nil);
				
				break;
				
			case 14:
				// owningUser;
				STAssertEqualObjects(question.owningUser.ID, [NSNumber numberWithInt:150], @"Owning user ID doesn't match", nil);
				
				STAssertEqualObjects(question.owningUser.userType, @"registered", @"Owning user type doesn't match", nil);
				
				STAssertEqualObjects(question.owningUser.displayName, @"Greg Bray", @"Owning user dispay name doesn't match", nil);
				
				STAssertEqualObjects(question.owningUser.emailHash, @"da1209aa320f9bbebbf128ac6a0751d3", @"Owning user email hash doesn't match", nil);
				
				STAssertEqualObjects(question.owningUser.reputation, [NSNumber numberWithInt:165], @"Owning user reputaion doesn't match", nil);
				
				break;
			
			default:

				break;
		}
		
	} 
	
	self.searchCount++;
}

-(void)questionServiceFinished:(id<PWSSOQuestionService>)questionService {

	self.testCaseLock = NO;
	self.done = YES;
	
	[questionService release];
}

-(void)questionServiceFailed:(id <PWSSOQuestionService>)questionService WithError:(NSError *)error{
	
	self.testCaseLock = NO;
	self.doneWithErrors = YES;
	self.receivedError = error;
	
	[questionService release];
}

@end
