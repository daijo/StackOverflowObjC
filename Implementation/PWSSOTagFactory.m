//
//  PWSSOTagFactory.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOTagFactory.h"
#import "PWSSOTagFactoryDelegate.h"

@implementation PWSSOTagFactory

@synthesize delegate;

- (id) initWithDelegate:(id<PWSSOTagFactoryDelegate>) newDelegate {
	if (self = [super init]){
		self.delegate = newDelegate;
	}
	return self;
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
	
	[self.delegate tagFactoryFailed:self WithError:error];
	[connection release];
}

@end