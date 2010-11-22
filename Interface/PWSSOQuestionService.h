//
//  PWSSOQuestionService.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/12/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PWSSOQuestionService <NSObject>

-(void)getQuestionsByTitle:(NSString *)title;
-(void)getUnansweredQuestionsByTags:(NSArray *)tags;

@end
