//
//  PWSSOBaseFactory.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/1/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOBaseFactory.h"


@implementation PWSSOBaseFactory

@synthesize parser, request;

static NSString * serverAddress = @"http://api.stackapps.com";
static NSString * queryOperator = @"?";
static NSString * arrayDelimiter = @";";
static NSString * quotation = @"'";

+(void)setServerAddress:(NSString *)newServerAddress {
	
	[serverAddress release];
	serverAddress = [newServerAddress retain];
}

+(NSString *)serverAddress {
	
	return serverAddress;
}

+(void)setQueryOperator:(NSString *)newQueryOperator {
	
	[queryOperator release];
	queryOperator = [newQueryOperator retain];
}

+(NSString *)queryOperator {
	
	return queryOperator;
}

+(void)setArrayDelimiter:(NSString *)newArrayDelimiter {
	
	[arrayDelimiter release];
	arrayDelimiter = [newArrayDelimiter retain];
}

+(NSString *)arrayDelimiter {
	
	return arrayDelimiter;
}

+(void)setQuotation:(NSString *)newQuotation {
	
	[quotation release];
	quotation = [newQuotation retain];
}

+(NSString *)quotation {
	
	return quotation;
}

- (void)makeRequest:(NSString *) url {
	self.request = url;
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:url]
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	self.parser = [[[YAJLParser alloc] init] autorelease];
	self.parser.delegate = self;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[self.parser parse:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {	
	[connection release];
}

-(void)parserDidStartDictionary:(YAJLParser *)parser {
    [self doesNotRecognizeSelector:_cmd];
}

-(void)parserDidEndDictionary:(YAJLParser *)parser {
    [self doesNotRecognizeSelector:_cmd];
}

-(void)parserDidStartArray:(YAJLParser *)parser {
    [self doesNotRecognizeSelector:_cmd];
}

-(void)parserDidEndArray:(YAJLParser *)parser {
    [self doesNotRecognizeSelector:_cmd];
}

-(void)parser:(YAJLParser *)parser didMapKey:(NSString *)key {
    [self doesNotRecognizeSelector:_cmd];
}

-(void)parser:(YAJLParser *)parser didAdd:(id)value {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)dealloc {
	self.request = nil;
	self.parser = nil;
	[super dealloc];
}

@end
