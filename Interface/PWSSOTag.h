//
//  PWSSOTag.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSSOTag <NSObject>

@property (copy) NSString *name;
@property (copy) NSNumber *count;
@property (assign) BOOL fulfillsRequired;

@end
