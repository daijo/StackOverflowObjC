//
//  PWSSOTagFactory.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOBaseFactory.h"

@protocol PWSSOTagFactoryDelegate;


@interface PWSSOTagFactory : PWSSOBaseFactory  <YAJLParserDelegate> {
	id<PWSSOTagFactoryDelegate> delegate;
}

@property (retain) id<PWSSOTagFactoryDelegate> delegate;

-(id) initWithDelegate:(id<PWSSOTagFactoryDelegate>) newDelegate;

@end
