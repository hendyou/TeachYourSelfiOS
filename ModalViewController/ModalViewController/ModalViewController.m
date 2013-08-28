//
//  ModalViewController.m
//  ModalViewController
//
//  Created by Hendy on 13-8-27.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    NSLog(@"loadView");
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.backgroundColor = [UIColor magentaColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    button.frame = CGRectMake(160 - 50, 100, 100, 40);
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
	[view addSubview:button];
    
    self.view = view;
    
    [view release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

- (void)dealloc
{
    NSLog(@"ModalViewController dead!");
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dismiss
{
    if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0 ) {
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

@end
