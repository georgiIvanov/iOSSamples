//
//  ViewController.h
//  ProteinTracker
//
//  Created by Georgi Ivanov on 10/27/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryViewController.h"

@interface MainViewController : UIViewController
{
    int total;
    NSMutableArray* amountHistory;
}
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *goalLabel;
@property (weak, nonatomic) IBOutlet UITextField *amoutText;
- (IBAction)addProtein:(id)sender;
-(IBAction)unwindToMain:(UIStoryboardSegue *)segue;
-(void)goalChanged:(NSNotification *)notofication;

@end
