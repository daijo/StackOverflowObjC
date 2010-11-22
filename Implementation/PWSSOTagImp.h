//
//  PWSSOTagImp.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOTag.h"


@interface PWSSOTagImp : NSObject <PWSSOTag> {
	NSString *name;
	NSNumber *count;
	BOOL *fulfillsRequired;
}

+(id<PWSSOTag>) tag;

@end
