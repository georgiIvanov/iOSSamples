//
//  AppDelegate.h
//  ObjectiveCPractice
//
//  Created by Georgi Ivanov on 10/28/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (copy) NSString* userName;
@property (weak) IBOutlet NSButton *btnButton;
@property (weak) IBOutlet NSTextField *txtHtml;


@end
