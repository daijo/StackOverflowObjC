//
//  PWSSOTagFactoryDelegate.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PWSSOTagFactory;
@protocol PWSSOTag;

@protocol PWSSOTagFactoryDelegate

-(void)tagFactory:(PWSSOTagFactory *)tagFactory gotTag:(id<PWSSOTag>)tag;
-(void)tagFactoryFinished:(PWSSOTagFactory *)tagFactory;
-(void)tagFactoryFailed:(PWSSOTagFactory *)tagFactory WithError:(NSError *)error;

@end
