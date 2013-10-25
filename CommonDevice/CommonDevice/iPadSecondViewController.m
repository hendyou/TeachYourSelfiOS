//
//  iPadSecondViewController.m
//  CommonDevice
//
//  Created by Hendy Ou on 13-10-24.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import "iPadSecondViewController.h"

@interface iPadSecondViewController ()

@end

@implementation iPadSecondViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
