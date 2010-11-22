//
//  PWSSOQuestionsByTitle.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/13/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOQuestionServiceDelegate.h"
#import "PWSSOQuestionFactoryDelegate.h"
#import "PWSSOQuestionFactory.h"

@interface PWSSOQuestionsByTitleFactory : PWSSOQuestionFactory {

}

+(id)questionFactoryWithDelegate:(id<PWSSOQuestionFactoryDelegate>) delegate;
-(void)getQuestionsByTitle:(NSString *)title;

@end
