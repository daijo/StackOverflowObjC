//
//  PWSSOUserByIdFactory.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/8/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PWSSOUserFactory.h"
#import "PWSSODetailedUser.h"

@interface PWSSOUserByDisplayNameFactory : PWSSOUserFactory {

}

+(id)userFactoryWithDelegate:(id<PWSSOUserFactoryDelegate>) delegate;
-(void)getUsersByDisplayName:(NSString *)displayName;

@end