//
//  PWSSODetailedUserImp.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSODetailedUser.h"


@interface PWSSODetailedUserImp : NSObject <PWSSODetailedUser> {
	NSNumber *ID;
	NSString *userType;
	NSString *displayName;
	NSNumber *reputation;
	NSString *emailHash;
	
	NSDate *creationDate;
	NSNumber *age;
	NSDate *lastAccessDate;
	NSURL *websiteUrl;
	NSString *location;
	NSString *about;
	NSNumber *questionCount;
	NSNumber *answerCount;
	NSNumber *viewCount;
	NSNumber *upVoteCount;
	NSNumber *downVoteCount;
	NSString *associationID;
	NSURL *questionsUrl;
	NSURL *answersUrl;
	NSURL *favoritesUrl;
	NSURL *tagsUrl;
	NSURL *badgesUrl;
	NSURL *timelineUrl;
	NSURL *mentionedUrl;
	NSURL *commentsUrl;
	NSURL *reputationUrl;
	NSNumber *goldBadgeCount;
	NSNumber *silverBadgeCount;
	NSNumber *bronzeBadgeCount;
}

+(id<PWSSODetailedUser>) user;

@end
