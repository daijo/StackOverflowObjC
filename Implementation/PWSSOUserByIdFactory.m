//
//  PWSSOUserByIdFactory.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/21/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOUserByIdFactory.h"


@implementation PWSSOUserByIdFactory

+(id)userFactoryWithDelegate:(id<PWSSOUserFactoryDelegate>) delegate {
	return [[[PWSSOUserByIdFactory alloc] initWithDelegate:delegate] autorelease];
}

-(void)getUserById:(NSNumber *)userId {
	parsingUsers = NO;
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/1.0/users/%@",
					   [PWSSOBaseFactory serverAddress],
					   [userId stringValue]]];
}

- (void)dealloc {
	
	self.currentKey = nil;
	self.user = nil;
	[super dealloc];
}

@end
