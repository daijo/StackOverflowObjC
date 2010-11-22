//
//  PWSSOTagImp.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOTagImp.h"


@implementation PWSSOTagImp

@synthesize name;
@synthesize count;
@synthesize fulfillsRequired;

+(id<PWSSOTag>)tag {
	return [[[PWSSOTagImp alloc] init] autorelease]; 
}

-(NSString *)description {
	return [NSString
			stringWithFormat:@"\nSTART - PWSSOTag\n"
			"Name:%@\n"
			"Count:%@\n"
			"Fulfills Required:%@\n"
			"END - PWSSOTag\n",
			self.name,			
			self.count,
			self.fulfillsRequired];
}

- (void)dealloc {
	self.name = nil;
	self.count = nil;
	[super dealloc];
}

@end
