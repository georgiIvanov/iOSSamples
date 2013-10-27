//
//  HistoryViewController.m
//  ProteinTracker
//
//  Created by Georgi Ivanov on 10/27/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setHistory:(NSMutableArray *)h
{
    history = h;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableString* text = [[NSMutableString alloc] init];
    
    for (NSNumber* number in history) {
        [text appendFormat:@"%@\r", number];
    }
    
    self.historyLabel.text = text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
