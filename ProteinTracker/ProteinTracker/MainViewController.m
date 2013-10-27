//
//  ViewController.m
//  ProteinTracker
//
//  Created by Georgi Ivanov on 10/27/13.
//  Copyright (c) 2013 Georgi Ivanov. All rights reserved.
//

#import "MainViewController.h"

//@interface MainViewController ()
//
//@end

@implementation MainViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self)
    {
        amountHistory = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setGoalFromUserDefaults:[NSUserDefaults standardUserDefaults]];
    
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(goalChanged:) name:NSUserDefaultsDidChangeNotification object:Nil];
}

-(void)goalChanged:(NSNotification *)notofication
{
    NSUserDefaults *defaults = (NSUserDefaults*)[notofication object];
    
    [self setGoalFromUserDefaults:defaults];
   
}

-(void)setGoalFromUserDefaults:(NSUserDefaults*) defaults
{
    NSInteger goal = [defaults integerForKey:@"goal"];
    
    self.goalLabel.text = [NSString stringWithFormat:@"%d", goal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addProtein:(id)sender {
    total += self.amoutText.text.intValue;
    self.totalLabel.text = [NSString stringWithFormat:@"%d", total];
    
    [amountHistory addObject:[NSNumber numberWithInt:self.amoutText.text.intValue]];
    
    if(total >= self.goalLabel.text.intValue)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"You reached your goal!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
}

-(IBAction)unwindToMain:(UIStoryboardSegue *)segue
{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showHistory"])
    {
        HistoryViewController* controller =
        (HistoryViewController*) segue.destinationViewController;
        [controller setHistory:amountHistory];
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
