//
//  PWSSOQuestionFactoryDelegate.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PWSSOQuestionFactory;
@protocol PWSSOQuestion;

@protocol PWSSOQuestionFactoryDelegate

-(void)questionFactory:(PWSSOQuestionFactory *)questionFactory gotQuestion:(id<PWSSOQuestion>)question;
-(void)questionFactoryFinished:(PWSSOQuestionFactory *)questionFactory;
-(void)questionFactoryFailed:(PWSSOQuestionFactory *)questionFactory WithError:(NSError *)error;

@end
