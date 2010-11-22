//
//  PWSDetailedUser.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/15/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOUser.h"

@protocol PWSSODetailedUser <PWSSOUser>

@property (retain) NSDate *creationDate;
@property (copy) NSNumber *age;
@property (retain) NSDate *lastAccessDate;
@property (retain) NSURL *websiteUrl;
@property (copy) NSString *location;
@property (copy) NSString *about;
@property (copy) NSNumber *questionCount;
@property (copy) NSNumber *answerCount;
@property (copy) NSNumber *viewCount;
@property (copy) NSNumber *upVoteCount;
@property (copy) NSNumber *downVoteCount;
@property (copy) NSString *associationID;
@property (retain) NSURL *questionsUrl;
@property (retain) NSURL *answersUrl;
@property (retain) NSURL *favoritesUrl;
@property (retain) NSURL *tagsUrl;
@property (retain) NSURL *badgesUrl;
@property (retain) NSURL *timelineUrl;
@property (retain) NSURL *mentionedUrl;
@property (retain) NSURL *commentsUrl;
@property (retain) NSURL *reputationUrl;
@property (copy) NSNumber *goldBadgeCount;
@property (copy) NSNumber *silverBadgeCount;
@property (copy) NSNumber *bronzeBadgeCount;

@end
