//
//  PWSSOUserByIdFactory.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/21/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOUserFactory.h"

@interface PWSSOUserByIdFactory : PWSSOUserFactory  {

}

+(id)userFactoryWithDelegate:(id<PWSSOUserFactoryDelegate>) delegate;
-(void)getUserById:(NSNumber *)userId;

@end
