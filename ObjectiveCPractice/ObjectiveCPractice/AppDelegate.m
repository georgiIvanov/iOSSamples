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
    
    [obj getData]; // protocol method call
    
    obj.btnButton = self.btnButton;
    
    [obj startTaskInBackground];
    
//    self.txtHtml.stringValue = @"lala eee nennene";
    
    // synch get request
    // self.txtHtml.stringValue = [self fetchAppleHomePage];
    [self asyncFetchAppleHomePage];
    
}

-(NSString*)fetchAppleHomePage
{
    NSURL* url = [NSURL URLWithString:@"http://www.apple.com"];
    NSMutableURLRequest *newRequest = [[NSMutableURLRequest alloc] init];
    [newRequest setHTTPMethod:@"GET"];
    [newRequest setURL:url];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:newRequest returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %d", url, (int)[responseCode statusCode]);
        
    }
    
    NSString* str =
    [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    return str;
    
}

-(void)setHtmlText:(NSString*) text
{
    self.txtHtml.stringValue = text;
}

-(void)asyncFetchAppleHomePage
{
    NSURL* url = [NSURL URLWithString:@"http://www.apple.com"];
    
    NSMutableURLRequest *newRequest = [[NSMutableURLRequest alloc] init];
    [newRequest setHTTPMethod:@"GET"];
    [newRequest setURL:url];
    
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    // __block NSData *oResponseData = nil;
    [NSURLConnection
     sendAsynchronousRequest:newRequest
     queue: myQueue
     completionHandler:^(NSURLResponse *response,
                         NSData* data, NSError* error){
         dispatch_async(dispatch_get_main_queue(),
                        ^{
                            
                            NSString* str =
                            [[NSString alloc]
                             initWithData:data
                             encoding:NSUTF8StringEncoding];
                            [self setHtmlText:str];
                        });
     }];
    
    
    
}

@end

@interface ConnectionDelegate : NSObject<NSURLConnectionDataDelegate>

@end

@implementation ConnectionDelegate



@end
