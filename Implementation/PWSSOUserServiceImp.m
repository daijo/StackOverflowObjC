//
//  PWSSOUserServiceImp.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOUserServiceDelegate.h"
#import "PWSSOUserServiceImp.h"
#import "PWSSOUserByIdFactory.h"
#import "PWSSOUserByDisplayNameFactory.h"


@implementation PWSSOUserServiceImp

@synthesize delegate;

-(id) initWithServiceDelegate:(id<PWSSOUserServiceDelegate>) newDelegate {
	if (self = [super init]){
		self.delegate = newDelegate;
		running = NO;
	}
	return self;
}

+(id)userServiceWithDelegate:(id<PWSSOUserServiceDelegate>) delegate {
	return [[[PWSSOUserServiceImp alloc] initWithServiceDelegate:delegate] autorelease]; 
}

-(void)getUserById:(NSNumber *)userId {
	if (!running) {
		running = YES;
		PWSSOUserByIdFactory *userFactory  = [PWSSOUserByIdFactory userFactoryWithDelegate:self];
		[userFactory getUserById:userId];
		[userFactory retain];
	}
}

-(void)getUsersByDisplayName:(NSString *)displayName {
	if (!running) {
		running = YES;
		PWSSOUserByDisplayNameFactory *userFactory  = [PWSSOUserByDisplayNameFactory userFactoryWithDelegate:self];
		 [userFactory getUsersByDisplayName:displayName];
		 [userFactory retain];
	}
}

-(void)userFactory:(PWSSOUserFactory *)userFactory gotUser:(id<PWSSODetailedUser>)user {
	[self.delegate userService:self gotUser:user];
}

-(void)userFactoryFinished:(PWSSOUserFactory *)userFactory {
	[self.delegate userServiceFinished:self];
	[userFactory release];
	running = NO;
}

-(void)userFactory:(PWSSOUserFactory *)userFactory didFailWithError:(NSError *)error {
	[self.delegate userService:self didFailWithError:error];
	[userFactory release];
	running = NO;
}

- (void)dealloc {
	[self.delegate release];
	[super dealloc];
}

@end
