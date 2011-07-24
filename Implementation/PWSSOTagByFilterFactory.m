//
//  PWSSOTagByFilterFactory.m
//  stackoverflowlib
//
//  Created by Daniel Hjort on 11/19/10.
//  Copyright 2010 Patchwork Solutions AB. All rights reserved.
//

#import "PWSSOTagByFilterFactory.h"

#import "PWSSOServiceFactory.h"
#import "PWSSOTagService.h"
#import "PWSSOBaseFactory.h"

@implementation PWSSOTagByFilterFactory

@synthesize currentKey, tag;

+(id)tagFactoryWithDelegate:(id<PWSSOTagFactoryDelegate>) delegate {
	return [[[PWSSOTagByFilterFactory alloc] initWithDelegate:delegate] autorelease]; 
}

-(void)getTagsByFilter:(NSString *)filter {
	
	parsingTags = NO;
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/1.0/tags/%@filter=%@",
					   [PWSSOBaseFactory serverAddress],
					   [PWSSOBaseFactory queryOperator],
					   filter]];
}

-(void)parserDidStartDictionary:(YAJLParser *)parser {
	
	if([self.currentKey isEqualToString:@"tags"]) {
		dictionaryLevel = 0;
	}
	if(dictionaryLevel == 0 && parsingTags) {
		self.tag = [[PWSSOTagImp alloc] init];
	}
	dictionaryLevel++;
}

-(void)parserDidEndDictionary:(YAJLParser *)parser {
	
	dictionaryLevel--;
	if (dictionaryLevel == 0 && self.tag != nil) {
        [self.tag autorelease];
		[self.delegate tagFactory:self gotTag:self.tag];
		self.tag = nil;
	}
}

-(void)parserDidStartArray:(YAJLParser *)parser {
	
	if([self.currentKey isEqualToString:@"tags"]) {
		arrayLevel = 0;
		parsingTags = YES;
	}
	arrayLevel++;
}

-(void)parserDidEndArray:(YAJLParser *)parser {
	
	arrayLevel--;
	if(parsingTags && arrayLevel == 0) {
		[self.delegate tagFactoryFinished:self];
	}
}

-(void)parser:(YAJLParser *)parser didMapKey:(NSString *)key {
	self.currentKey = key;
}

-(void)parser:(YAJLParser *)parser didAdd:(id)value {
	
	if ([self.currentKey isEqualToString:@"total"]) {
		if([value isEqualToNumber:[NSNumber numberWithInt:0]]) {
			parsingTags = NO;
		}
	}
	
	if(self.tag != nil) {
		if ([self.currentKey isEqualToString:@"name"]) {
			self.tag.name = value;
		} else if ([self.currentKey isEqualToString:@"count"]) {
			self.tag.count = value;
		} else if ([self.currentKey isEqualToString:@"fulfills_required"]) {
			self.tag.fulfillsRequired = [value boolValue];
		}
	}
}

- (void)dealloc {
	
	self.currentKey = nil;
	self.tag = nil;
	[super dealloc];
}

@end
