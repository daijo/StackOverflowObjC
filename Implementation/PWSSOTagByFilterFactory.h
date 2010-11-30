//
//  PWSSOTagByFilterFactory.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOTagServiceDelegate.h"
#import "PWSSOTagFactoryDelegate.h"
#import "PWSSOTagFactory.h"
#import "PWSSOTagImp.h"


@interface PWSSOTagByFilterFactory : PWSSOTagFactory <YAJLParserDelegate> {
	NSString* currentKey;
	PWSSOTagImp* tag;
	int dictionaryLevel;
	int arrayLevel;
	BOOL parsingTags;
}

@property (retain) PWSSOTagImp* tag;
@property (retain) NSString* currentKey;

+(id)tagFactoryWithDelegate:(id<PWSSOTagFactoryDelegate>) delegate;
-(void)getTagsByFilter:(NSString *)filter;

@end