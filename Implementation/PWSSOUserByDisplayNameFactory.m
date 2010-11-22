//
//  PWSSOUserByIdFactory.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/8/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOUserByDisplayNameFactory.h"


@implementation PWSSOUserByDisplayNameFactory

+(id)userFactoryWithDelegate:(id<PWSSOUserFactoryDelegate>) delegate {
	return [[[PWSSOUserByDisplayNameFactory alloc] initWithDelegate:delegate] autorelease];
}

-(void)getUsersByDisplayName:(NSString *)displayName {
	parsingUsers = NO;
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/1.0/users/%@filter=%@",
					   [PWSSOBaseFactory serverAddress],
					   [PWSSOBaseFactory queryOperator],
					   displayName]];
}

- (void)dealloc {
	
	self.currentKey = nil;
	self.user = nil;
	[super dealloc];
}

@end
