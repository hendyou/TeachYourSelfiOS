//
//  ViewController.m
//  DateCalculator
//
//  Created by Hendy on 13-3-30.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showDateChooser:(id)sender {
    if (self.dateChooserVisible != YES) {
        //手动切换场景
        [self performSegueWithIdentifier: @"toDateChooser" sender: sender];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((DateChooserViewController *)segue.destinationViewController).delegate = self;
}

- (void)calculateDate:(NSDate *)date
{
    NSDate *today = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd ahh:mm:ss"];
    NSString *choseDate = [dateFormat stringFromDate: date];
    NSString *todayStr = [dateFormat stringFromDate: today];
    
    NSTimeInterval difference = fabs([today timeIntervalSinceDate: date]);
    
    
    NSString *content = [NSString stringWithFormat:@"%@\n和\n%@\n相差\n%1.0f天%d时%d分%d秒", todayStr, choseDate, difference/24/60/60, ((int)difference)%(24*60*60)/(60*60),((int)difference)%(24*60*60)%(60*60)/60, ((int)difference)%(24*60*60)%60];
    
    self.outputLabel.text = content;
}
@end
