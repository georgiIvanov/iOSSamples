//
//  ViewController.h
//  HelloWorld_1
//
//  Created by Georgi Ivanov on 10/27/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
- (IBAction)buttonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end
