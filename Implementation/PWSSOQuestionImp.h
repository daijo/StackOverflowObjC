//
//  PWSSOQuestionImp.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOQuestion.h"

@interface PWSSOQuestionImp : NSObject <PWSSOQuestion> {
	NSString *title;
	NSURL *questionTimeline;
	NSURL *questionComments;
	NSURL *questionAnswers;
	NSDate *creationDate;
	NSDate *lastEditDate;
	NSDate *lastActivityDate;
	NSNumber *ID;
	NSNumber *answerCount;
	NSNumber *favoriteCount;
	NSNumber *upVoteCount;
	NSNumber *downVoteCount;
	NSNumber *viewCount;
	NSNumber *score;
	id<PWSSOUser> owningUser;
}

+(id<PWSSOQuestion>) question;

@end
