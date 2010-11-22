//
//  PWSSOQuestionImp.m
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOQuestionImp.h"

@implementation PWSSOQuestionImp

@synthesize title;
@synthesize questionTimeline;
@synthesize questionComments;
@synthesize questionAnswers;
@synthesize creationDate;
@synthesize lastEditDate;
@synthesize lastActivityDate;
@synthesize ID;
@synthesize answerCount;
@synthesize favoriteCount;
@synthesize upVoteCount;
@synthesize downVoteCount;
@synthesize viewCount;
@synthesize score;
@synthesize owningUser;

+(id<PWSSOQuestion>)question {
	return [[[PWSSOQuestionImp alloc] init] autorelease]; 
}

-(NSString *)description {
	return [NSString
			stringWithFormat:@"\nSTART - PWSSOQuestion\n"
			"Title:%@\n"
			"Question Timeline URL:%@\n"
			"Question Comment URL:%@\n"
			"Question Answers URL:%@\n"
			"Creation Date:%@\n"
			"Last Edit Date:%@\n"
			"Last Activity Date:%@\n"
			"ID:%@\n"
			"Answer Count:%@\n"
			"Favorite Count:%@\n"
			"Up Vote Count:%@\n"
			"Down Vote Count:%@\n"
			"View Count:%@\n"			
			"Score:%@\n"
			"Owner:%@"
			"END - PWSSOQuestion\n",
			self.title,			
			self.questionTimeline,
			self.questionComments,
			self.questionAnswers,
			self.creationDate,
			self.lastEditDate,
			self.lastActivityDate,
			self.ID,
			self.answerCount,
			self.favoriteCount,
			self.upVoteCount,
			self.downVoteCount,
			self.viewCount,
			self.score,
			[self.owningUser description]];
}

- (void)dealloc {
	self.title = nil;
	self.questionTimeline = nil;
	self.questionComments = nil;
	self.questionAnswers = nil;
	self.creationDate = nil;
	self.lastEditDate = nil;
	self.lastActivityDate = nil;
	self.ID = nil;
	self.answerCount = nil;
	self.favoriteCount = nil;
	self.upVoteCount = nil;
	self.downVoteCount = nil;
	self.viewCount = nil;
	self.score = nil;
	self.owningUser = nil;
	[super dealloc];
}

@end
