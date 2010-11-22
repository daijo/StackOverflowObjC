//
//  PWSSOUserService.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/7/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSSOUserService <NSObject>

-(void)getUserById:(NSNumber *)userId;
-(void)getUsersByDisplayName:(NSString *)displayName;

@end
