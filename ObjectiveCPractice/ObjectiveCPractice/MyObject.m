//
//  MyObject.m
//  ObjectiveCPractice
//
//  Created by Georgi Ivanov on 10/28/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import "MyObject.h"
#import <dispatch/dispatch.h>

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
-(void) startTaskInBackground
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        int a;
        for (int i = 0; i < 1000000; i++) {
            
            a = i;
            for (int j = 0; j < 500; j++) {
                
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //self.btnButton.title = [[NSString alloc] initWithFormat:@"%d",a ];
            self.btnButton.title = [[NSString alloc] initWithFormat:
                                    @"Background muthafucka"];
        });
    });
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
