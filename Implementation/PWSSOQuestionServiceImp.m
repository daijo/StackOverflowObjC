//
//  PWSSOQuestionServiceImp.m
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOQuestionServiceDelegate.h"
#import "PWSSOQuestionServiceImp.h"
#import "PWSSOQuestionsByTitleFactory.h"
#import "PWSSOUnansweredQuestionsByTagsFactory.h"

@implementation PWSSOQuestionServiceImp

@synthesize delegate;

-(id) initWithServiceDelegate:(id<PWSSOQuestionServiceDelegate>) newDelegate {
	if (self = [super init]){
		self.delegate = newDelegate;
		running = NO;
	}
	return self;
}

+(id)questionServiceWithDelegate:(id<PWSSOQuestionServiceDelegate>) delegate {
	return [[[PWSSOQuestionServiceImp alloc] initWithServiceDelegate:delegate] autorelease]; 
}

-(void)getQuestionsByTitle:(NSString *)title {
	if (!running) {
		running = YES;
		PWSSOQuestionsByTitleFactory *questionFactory  = [PWSSOQuestionsByTitleFactory questionFactoryWithDelegate:self];
		[questionFactory getQuestionsByTitle:title];
		[questionFactory retain];
	}
}

-(void)getUnansweredQuestionsByTags:(NSArray *)tags {
	if (!running) {
		running = YES;
		PWSSOUnansweredQuestionsByTagsFactory *questionFactory  = [PWSSOUnansweredQuestionsByTagsFactory questionFactoryWithDelegate:self];
		[questionFactory getUnansweredQuestionsByTags:tags];
		[questionFactory retain];
	}
}

- (void)questionFactory:(PWSSOQuestionFactory *)questionFactory gotQuestion:(id<PWSSOQuestion>)question  {
	[self.delegate questionService:self gotQuestion:question];
}

- (void)questionFactoryFinished:(PWSSOQuestionFactory *)questionFactory
{
	[self.delegate questionServiceFinished:self];
	[questionFactory release];
	running = NO;
}

-(void)questionFactoryFailed:(PWSSOQuestionFactory *)questionFactory WithError:(NSError *)error {
	[self.delegate questionServiceFailed:self WithError:error];
	[questionFactory release];
	running = NO;
}

- (void)dealloc {
	[self.delegate release];
	[super dealloc];
}

@end
