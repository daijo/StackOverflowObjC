//
//  PWSSOQuestionFactory.m
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOQuestionFactory.h"
#import "PWSSOQuestionFactoryDelegate.h"

@implementation PWSSOQuestionFactory

@synthesize delegate, currentKey, question;

- (id) initWithDelegate:(id<PWSSOQuestionFactoryDelegate>) newDelegate {
	if (self = [super init]){
		self.delegate = newDelegate;
	}
	return self;
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
	
	[self.delegate questionFactoryFailed:self WithError:error];
	[connection release];
}

-(void)parserDidStartDictionary:(YAJLParser *)parser {
	
	if([self.currentKey isEqualToString:@"questions"]) {
		dictionaryLevel = 0;
	}
	if(dictionaryLevel == 0 && parsingQuestions) {
		self.question = [[PWSSOQuestionImp alloc] init];
		self.question.owningUser = [[PWSSOUserImp alloc] init];
	}
	dictionaryLevel++;
}

-(void)parserDidEndDictionary:(YAJLParser *)parser {
	
	dictionaryLevel--;
	if (parsingQuestions && dictionaryLevel == 0) {
		[self.delegate questionFactory:self gotQuestion:self.question];
		self.question = nil;
	}
}

-(void)parserDidStartArray:(YAJLParser *)parser {
	
	if([self.currentKey isEqualToString:@"questions"]) {
		arrayLevel = 0;
		parsingQuestions = YES;
	}
	arrayLevel++;
}

-(void)parserDidEndArray:(YAJLParser *)parser {
	
	arrayLevel--;
	if(parsingQuestions && arrayLevel == 0) {
		[self.delegate questionFactoryFinished:self];
	}
}

-(void)parser:(YAJLParser *)parser didMapKey:(NSString *)key {
	self.currentKey = key;
}

-(void)parser:(YAJLParser *)parser didAdd:(id)value {
	
	if(self.question != nil) {
		if ([self.currentKey isEqualToString:@"answer_count"]) {
			self.question.answerCount = value;
		} else if ([self.currentKey isEqualToString:@"favorite_count"]) {
			self.question.favoriteCount = value;
		} else if ([self.currentKey isEqualToString:@"question_timeline_url"]) {
			self.question.questionTimeline = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"question_comments_url"]) {
			self.question.questionComments = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"question_answers_url"]) {
			self.question.questionAnswers = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"creation_date"]) {
			self.question.creationDate = [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)value intValue]];
		} else if ([self.currentKey isEqualToString:@"last_edit_date"]) {
			self.question.lastEditDate = [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)value intValue]];
		} else if ([self.currentKey isEqualToString:@"last_activity_date"]) {
			self.question.lastActivityDate = [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)value intValue]];
		} else if ([self.currentKey isEqualToString:@"up_vote_count"]) {
			self.question.upVoteCount = value;
		} else if ([self.currentKey isEqualToString:@"down_vote_count"]) {
			self.question.downVoteCount = value;
		} else if ([self.currentKey isEqualToString:@"view_count"]) {
			self.question.viewCount = value;
		} else if ([self.currentKey isEqualToString:@"score"]) {
			self.question.score = value;
		} else if ([self.currentKey isEqualToString:@"title"]) {
			self.question.title = value;
		} else if ([self.currentKey isEqualToString:@"question_id"]) {
			self.question.ID = value;
		} else if ([self.currentKey isEqualToString:@"user_id"]) {
			self.question.owningUser.ID = value;
		} else if ([self.currentKey isEqualToString:@"user_type"]) {
			self.question.owningUser.userType = value;
		} else if ([self.currentKey isEqualToString:@"display_name"]) {
			self.question.owningUser.displayName = value;
		} else if ([self.currentKey isEqualToString:@"reputation"]) {
			self.question.owningUser.reputation = value;
		} else if ([self.currentKey isEqualToString:@"email_hash"]) {
			self.question.owningUser.emailHash = value;
		}
	}
}

@end
