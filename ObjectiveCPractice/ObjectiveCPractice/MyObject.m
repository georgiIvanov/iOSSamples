//
//  MyObject.m
//  ObjectiveCPractice
//
//  Created by Georgi Ivanov on 10/28/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import "MyObject.h"

@implementation MyObject
{
    int aValue;
}

@synthesize value=aValue;

+(id) objectWithValue:(int)value
{
    return ([[self alloc] initWithValue: value]);
}

-(id) initWithValue:(int)value
{
    self = [super init];
    if(self == nil)
    {
        return  (nil);
    }
    
    aValue = value;
    
    return (self);
}

-(NSString*) Haha
{
    return [[NSString alloc] initWithFormat:@"LOL"];
}

-(NSString*) getData
{
    return @"this is remote data";
}

-(id) init
{
    return ([self initWithValue:0]);
}

@end
