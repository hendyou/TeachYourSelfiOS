//
//  RootViewController.m
//  NavigationController
//
//  Created by Hendy on 13-8-28.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = view;
    [view release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(160 - 50, 30, 100, 40)];
    [button addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
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

- (void)push:(id)sender
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    //Navigation has: {rootViewController, secondViewController}
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC release];
}

@end
