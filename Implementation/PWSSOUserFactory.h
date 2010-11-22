//
//  PWSSOuserFactory.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOBaseFactory.h"

#import "PWSSODetailedUserImp.h"

@protocol PWSSOUserFactoryDelegate;

@interface PWSSOUserFactory : PWSSOBaseFactory  <YAJLParserDelegate> {
	id<PWSSOUserFactoryDelegate> delegate;
	NSString* currentKey;
	PWSSODetailedUserImp* user;
	int dictionaryLevel;
	int arrayLevel;
	BOOL parsingUsers;
}

@property (retain) id<PWSSOUserFactoryDelegate> delegate;
@property (retain) PWSSODetailedUserImp* user;
@property (retain) NSString* currentKey;

-(id) initWithDelegate:(id<PWSSOUserFactoryDelegate>) newDelegate;

@end