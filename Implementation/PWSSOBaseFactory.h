//
//  PWSSOBaseFactory.h
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/1/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YAJLIOS/YAJLIOS.h>

@interface PWSSOBaseFactory : NSObject <YAJLParserDelegate> {
	YAJLParser *parser;
	NSString *request;
}

@property (retain) YAJLParser *parser;
@property (copy) NSString* request;

+(void)setServerAddress:(NSString *)newServerAddress;
+(NSString *)serverAddress;
+(void)setQueryOperator:(NSString *)newQueryOperator;
+(NSString *)queryOperator;
+(void)setArrayDelimiter:(NSString *)newArrayDelimiter;
+(NSString *)arrayDelimiter;
+(void)setQuotation:(NSString *)newQuotation;
+(NSString *)quotation;

-(void)makeRequest:(NSString *) url;

@end
