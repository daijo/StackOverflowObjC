//
//  PWSSOTagService.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSSOTagService <NSObject>

-(void)getTagsByFilter:(NSString *)filter;

@end
