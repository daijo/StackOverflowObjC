//
//  PWSSODetailedUserImp.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSODetailedUserImp.h"


@implementation PWSSODetailedUserImp

@synthesize creationDate;
@synthesize age;
@synthesize lastAccessDate;
@synthesize websiteUrl;
@synthesize location;
@synthesize about;
@synthesize questionCount;
@synthesize answerCount;
@synthesize viewCount;
@synthesize upVoteCount;
@synthesize downVoteCount;
@synthesize associationID;
@synthesize questionsUrl;
@synthesize answersUrl;
@synthesize favoritesUrl;
@synthesize tagsUrl;
@synthesize badgesUrl;
@synthesize timelineUrl;
@synthesize mentionedUrl;
@synthesize commentsUrl;
@synthesize reputationUrl;
@synthesize goldBadgeCount;
@synthesize silverBadgeCount;
@synthesize bronzeBadgeCount;

//Super
@synthesize emailHash;
@synthesize reputation;
@synthesize displayName;
@synthesize userType;
@synthesize ID;

+(id<PWSSODetailedUser>)user {
	return [[[PWSSODetailedUserImp alloc] init] autorelease]; 
}

-(NSString *)description {
	return [NSString
			stringWithFormat:@"\nSTART - PWSSODetailedUser\n"
			"%@"
			"Creation Date:%@\n"
			"Age:%@\n"
			"Last Access Date:%@\n"
			"Website URL:%@\n"
			"Location:%@\n"
			"About:%@\n"
			"Question Count:%@\n"
			"Answer Count:%@\n"
			"View Count:%@\n"
			"Up Vote Count:%@\n"
			"Down Vote Count:%@\n"
			"Associated ID:%@\n"			
			"Questions URL:%@\n"
			"Answers URL:%@\n"
			"Favorites URL:%@\n"
			"Tags URL:%@\n"
			"Badge URL:%@\n"
			"Timeline URL:%@\n"
			"Mentioned URL:%@\n"
			"Comments URL:%@\n"
			"Reputation URL:%@\n"
			"Gold Badge Count:%@"
			"Bronze Badge Count:%@"
			"Silver Badge Count:%@"
			"END - PWSSODetailedUser\n",
			//[super description],
			self.creationDate,
			self.age,
			self.lastAccessDate,
			self.websiteUrl,
			self.location,
			self.about,
			self.questionCount,
			self.answerCount,
			self.viewCount,
			self.upVoteCount,
			self.downVoteCount,
			self.associationID,
			self.questionsUrl,
			self.answersUrl,
			self.favoritesUrl,
			self.tagsUrl,
			self.badgesUrl,
			self.timelineUrl,
			self.mentionedUrl,
			self.commentsUrl,
			self.reputationUrl,
			self.goldBadgeCount,
			self.silverBadgeCount,
			self.bronzeBadgeCount];
}

- (void)dealloc {
	self.creationDate = nil;
	self.age = nil;
	self.lastAccessDate = nil;
	self.websiteUrl = nil;
	self.location = nil;
	self.about = nil;
	self.questionCount = nil;
	self.answerCount = nil;
	self.viewCount = nil;
	self.upVoteCount = nil;
	self.downVoteCount = nil;
	self.associationID = nil;
	self.questionsUrl = nil;
	self.answersUrl = nil;
	self.favoritesUrl = nil;
	self.tagsUrl = nil;
	self.badgesUrl = nil;
	self.timelineUrl = nil;
	self.mentionedUrl = nil;
	self.commentsUrl = nil;
	self.reputationUrl = nil;
	self.goldBadgeCount = nil;
	self.silverBadgeCount = nil;
	self.bronzeBadgeCount = nil;
	[super dealloc];
}

@end
