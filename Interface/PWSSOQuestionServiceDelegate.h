//
//  PWSSOQuestionServiceDelegate.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/12/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

@protocol PWSSOQuestionService;
@protocol PWSSOQuestion;

@protocol PWSSOQuestionServiceDelegate <NSObject>

-(void)questionService:(id<PWSSOQuestionService>)questionService gotQuestion:(id<PWSSOQuestion>)question;
-(void)questionServiceFinished:(id<PWSSOQuestionService>)questionService;
-(void)questionServiceFailed:(id<PWSSOQuestionService>)questionService WithError:(NSError *)error;

@end
