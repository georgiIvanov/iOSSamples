//
//  AppDelegate.m
//  ObjectiveCPractice
//
//  Created by Georgi Ivanov on 10/28/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import "AppDelegate.h"
#import "MyObject.h"

@implementation AppDelegate

@synthesize userName;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
//    MyObject* obj = [MyObject objectWithValue:5];
    MyObject* obj = [[MyObject alloc] init];
    
    self.btnButton.title = [[NSString alloc] initWithFormat:@"%d", obj.value];
    
    self.btnButton.title = [obj Haha];
    
    [obj getData];
}

@end
