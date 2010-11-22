//
//  PWSSOTagServiceDelegate.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PWSSOTag;
@protocol PWSSOTagService;


@protocol PWSSOTagServiceDelegate

-(void)tagService:(id<PWSSOTagService>)tagService gotTag:(id<PWSSOTag>)tag;
-(void)tagServiceFinished:(id<PWSSOTagService>)tagService;
-(void)tagService:(id<PWSSOTagService>)tagService didFailWithError:(NSError *)error;

@end
