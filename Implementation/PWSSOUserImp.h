//
//  PWSSOUserImp.h
//  stackoverflow
//
//  Created by Daniel Hjort on 10/15/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSSOUser.h"

@interface PWSSOUserImp : NSObject <PWSSOUser> {
	NSNumber *ID;
	NSString *userType;
	NSString *displayName;
	NSNumber *reputation;
	NSString *emailHash;
}

+(id<PWSSOUser>) user;

@end
