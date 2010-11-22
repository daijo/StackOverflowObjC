//
//  PWSSOQuestionsByTitle.m
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOQuestionsByTitleFactory.h"
#import "PWSSOServiceFactory.h"
#import "PWSSOQuestionService.h"
#import "PWSSOBaseFactory.h"

@implementation PWSSOQuestionsByTitleFactory

+(id)questionFactoryWithDelegate:(id<PWSSOQuestionFactoryDelegate>) delegate {
	return [[[PWSSOQuestionsByTitleFactory alloc] initWithDelegate:delegate] autorelease]; 
}

-(void)getQuestionsByTitle:(NSString *)title {

	parsingQuestions = NO;
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/1.0/search/%@intitle=%@",
					   [PWSSOBaseFactory serverAddress],
					   [PWSSOBaseFactory queryOperator],
					   title]];
}

- (void)dealloc {
	
	self.currentKey = nil;
	self.question = nil;
	[super dealloc];
}

@end
