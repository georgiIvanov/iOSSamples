//
//  ViewController.m
//  HelloWorld_1
//
//  Created by Georgi Ivanov on 10/27/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.messageLabel.text = @"Hello iOS";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    self.messageLabel.text = self.textField.text;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
