//
//  DateChooserViewController.m
//  DateCalculator
//
//  Created by Hendy on 13-3-30.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "DateChooserViewController.h"

@interface DateChooserViewController ()

@end

@implementation DateChooserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated
{
    ((ViewController *)self.delegate).dateChooserVisible = NO;
//    [self setDelegate: nil];
    self.delegate = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissDateChooser:(id)sender {
    [((ViewController *)self.delegate) calculateDate: self.datePicker.date];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setDateTime:(id)sender
{
    [((ViewController *) self.delegate) calculateDate: ((UIDatePicker *) sender).date];
}
@end
