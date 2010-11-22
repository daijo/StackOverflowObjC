//
//  PWSSOUnansweredQuestionsByTagsFactory.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/21/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOUnansweredQuestionsByTagsFactory.h"


@implementation PWSSOUnansweredQuestionsByTagsFactory

+(id)questionFactoryWithDelegate:(id<PWSSOQuestionFactoryDelegate>) delegate {
	return [[[PWSSOUnansweredQuestionsByTagsFactory alloc] initWithDelegate:delegate] autorelease]; 
}

-(NSString *)makeTagsString:(NSArray *)tags {
	NSMutableString *result = [NSMutableString stringWithCapacity:20];//@"objective-ccocoa";
	
	for (NSString *element in tags) {
		[result appendFormat:
		 @"%@%@%@%@", 
		 [PWSSOBaseFactory quotation],
		 element,
		 [PWSSOBaseFactory quotation],
		 [PWSSOBaseFactory arrayDelimiter]];
	}
	
	return result;
}

-(void)getUnansweredQuestionsByTags:(NSArray *)tags {
	
	parsingQuestions = NO;
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/1.0/questions/unanswered/%@tagged=%@",
					   [PWSSOBaseFactory serverAddress],
					   [PWSSOBaseFactory queryOperator],
					   [self makeTagsString:tags]]];
}

- (void)dealloc {
	
	self.currentKey = nil;
	self.question = nil;
	[super dealloc];
}

@end
