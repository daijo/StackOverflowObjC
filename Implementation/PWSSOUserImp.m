//
//  PWSSOUserImp.m
//  stackoverflow
//
//  Created by Daniel Hjort on 10/15/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOUserImp.h"

@implementation PWSSOUserImp

@synthesize ID;
@synthesize userType;
@synthesize displayName;
@synthesize reputation;
@synthesize emailHash;

+(id<PWSSOUser>)user {
	return [[[PWSSOUserImp alloc] init] autorelease]; 
}

-(NSString *)description {
	return [NSString
			stringWithFormat:@"\nSTART - PWSSOUser\n"
			"ID:%@\n"
			"User Type:%@\n"
			"Display Name:%@\n"
			"Reputation:%@\n"
			"E-mail Hash:%@\n"
			"END - PWSSOUser\n",
			self.ID,			
			self.userType,
			self.displayName,
			self.reputation,
			self.emailHash];
}

- (void)dealloc {
	self.ID = nil;
	self.userType = nil;
	self.displayName = nil;
	self.reputation = nil;
	self.emailHash = nil;
	[super dealloc];
}

@end
