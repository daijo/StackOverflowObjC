//
//  PWSSOuserFactory.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOUserFactory.h"
#import "PWSSOUserFactoryDelegate.h"

@implementation PWSSOUserFactory

@synthesize delegate, currentKey, user;

- (id) initWithDelegate:(id<PWSSOUserFactoryDelegate>) newDelegate {
	if (self = [super init]){
		self.delegate = newDelegate;
	}
	return self;
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
	
	[self.delegate userFactory:self didFailWithError:error];
	[connection release];
}

-(void)parserDidStartDictionary:(YAJLParser *)parser {
	
	if([self.currentKey isEqualToString:@"users"]) {
		dictionaryLevel = 0;
	}
	if(dictionaryLevel == 0 && parsingUsers) {
		self.user = [[PWSSODetailedUserImp alloc] init];
	}
	dictionaryLevel++;
}

-(void)parserDidEndDictionary:(YAJLParser *)parser {
	
	dictionaryLevel--;
	if (dictionaryLevel == 0 && self.user != nil) {
        [self.user autorelease];
		[self.delegate userFactory:self gotUser:self.user];
		self.user = nil;
	}
}

-(void)parserDidStartArray:(YAJLParser *)parser {
	
	if([self.currentKey isEqualToString:@"users"]) {
		arrayLevel = 0;
		parsingUsers = YES;
	}
	arrayLevel++;
}

-(void)parserDidEndArray:(YAJLParser *)parser {
	
	arrayLevel--;
	if(arrayLevel == 0) {
		[self.delegate userFactoryFinished:self];
	}
}

-(void)parser:(YAJLParser *)parser didMapKey:(NSString *)key {
	self.currentKey = key;
}

-(void)parser:(YAJLParser *)parser didAdd:(id)value {
	
	if ([self.currentKey isEqualToString:@"total"]) {
		if([value isEqualToNumber:[NSNumber numberWithInt:0]]) {
			parsingUsers = NO;
		}
	}
	
	if(self.user != nil) {
		if ([self.currentKey isEqualToString:@"user_id"]) {
			self.user.ID = value;
		} else if ([self.currentKey isEqualToString:@"user_type"]) {
			self.user.userType = value;
		} else if ([self.currentKey isEqualToString:@"display_name"]) {
			self.user.displayName = value;
		} else if ([self.currentKey isEqualToString:@"reputation"]) {
			self.user.reputation = value;
		} else if ([self.currentKey isEqualToString:@"email_hash"]) {
			self.user.emailHash = value;
		} else if ([self.currentKey isEqualToString:@"creation_date"]) {
			self.user.creationDate = [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)value intValue]];
		} else if ([self.currentKey isEqualToString:@"age"]) {
			self.user.age = value;
		} else if ([self.currentKey isEqualToString:@"last_access_date"]) {
			self.user.lastAccessDate = [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)value intValue]];
		} else if ([self.currentKey isEqualToString:@"website_url"]) {
			self.user.websiteUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"location"]) {
			self.user.location = value;
		} else if ([self.currentKey isEqualToString:@"about_me"]) {
			self.user.about = value;
		} else if ([self.currentKey isEqualToString:@"question_count"]) {
			self.user.questionCount = value;
		} else if ([self.currentKey isEqualToString:@"answer_count"]) {
			self.user.answerCount = value;
		} else if ([self.currentKey isEqualToString:@"view_count"]) {
			self.user.viewCount = value;
		} else if ([self.currentKey isEqualToString:@"up_vote_count"]) {
			self.user.upVoteCount = value;
		} else if ([self.currentKey isEqualToString:@"down_vote_count"]) {
			self.user.downVoteCount = value;
		} else if ([self.currentKey isEqualToString:@"association_id"]) {
			self.user.associationID = value;
		} else if ([self.currentKey isEqualToString:@"user_questions_url"]) {
			self.user.questionsUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"user_answers_url"]) {
			self.user.answersUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"user_tags_url"]) {
			self.user.tagsUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"user_favorites_url"]) {
			self.user.favoritesUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"user_badges_url"]) {
			self.user.badgesUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"user_mentioned_url"]) {
			self.user.mentionedUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"user_comments_url"]) {
			self.user.commentsUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"user_reputation_url"]) {
			self.user.reputationUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"user_timeline_url"]) {
			self.user.timelineUrl = [NSURL URLWithString:value];
		} else if ([self.currentKey isEqualToString:@"gold"]) {
			self.user.goldBadgeCount = value;
		} else if ([self.currentKey isEqualToString:@"silver"]) {
			self.user.silverBadgeCount = value;
		} else if ([self.currentKey isEqualToString:@"bronze"]) {
			self.user.bronzeBadgeCount = value;
		} 
	}
}

@end