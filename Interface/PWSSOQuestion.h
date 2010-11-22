//
//  PWSSOQuestion.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/12/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOUser.h"

@protocol PWSSOQuestion <NSObject>

@property (copy) NSString *title;
@property (retain) NSURL *questionTimeline;
@property (retain) NSURL *questionComments;
@property (retain) NSURL *questionAnswers;
@property (retain) NSDate *creationDate;
@property (retain) NSDate *lastEditDate;
@property (retain) NSDate *lastActivityDate;
@property (copy) NSNumber *ID;
@property (copy) NSNumber *answerCount;
@property (copy) NSNumber *favoriteCount;
@property (copy) NSNumber *upVoteCount;
@property (copy) NSNumber *downVoteCount;
@property (copy) NSNumber *viewCount;
@property (copy) NSNumber *score;
@property (retain) id<PWSSOUser> owningUser;

@end
