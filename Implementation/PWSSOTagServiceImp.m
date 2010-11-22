//
//  PWSSOTagServiceImp.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOTagServiceImp.h"
#import "PWSSOTagServiceDelegate.h"
#import "PWSSOTagServiceImp.h"
#import "PWSSOTagByFilterFactory.h"


@implementation PWSSOTagServiceImp

@synthesize delegate;

-(id) initWithServiceDelegate:(id<PWSSOTagServiceDelegate>) newDelegate {
	if (self = [super init]){
		self.delegate = newDelegate;
		running = NO;
	}
	return self;
}

+(id)tagServiceWithDelegate:(id<PWSSOTagServiceDelegate>) delegate {
	return [[[PWSSOTagServiceImp alloc] initWithServiceDelegate:delegate] autorelease]; 
}

-(void)getTagsByFilter:(NSString *)filter {
	if (!running) {
		running = YES;
		PWSSOTagByFilterFactory *tagFactory  = [PWSSOTagByFilterFactory tagFactoryWithDelegate:self];
		[tagFactory getTagsByFilter:filter];
		[tagFactory retain];
	}
}

- (void)tagFactory:(PWSSOTagFactory *)tagFactory gotTag:(id<PWSSOTag>)tag {
	[self.delegate tagService:self gotTag:tag];
}

- (void)tagFactoryFinished:(PWSSOTagFactory *)tagFactory
{
	[self.delegate tagServiceFinished:self];
	[tagFactory release];
	running = NO;
}

-(void)tagFactoryFailed:(PWSSOTagFactory *)tagFactory WithError:(NSError *)error {
	[self.delegate tagServiceFailed:self WithError:error];
	[tagFactory release];
	running = NO;
}

- (void)dealloc {
	[self.delegate release];
	[super dealloc];
}

@end
