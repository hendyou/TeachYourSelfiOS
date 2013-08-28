//
//  SecondViewController.m
//  NavigationController
//
//  Created by Hendy on 13-8-28.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    
    UIButton *backgroundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundBtn setFrame: [[UIScreen mainScreen] applicationFrame]];
    [backgroundBtn addTarget:self action:@selector(hideOrShowNavigationBar:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backgroundBtn];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"hide or show" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(160 - 70, 30, 140, 40)];
    [button addTarget:self action:@selector(hideOrShowToolBar:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setFrame:CGRectMake(160 - 70, 100, 140, 40)];
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn setFrame:CGRectMake(160 - 70, 170, 140, 40)];
    [pushBtn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:pushBtn];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //显示toolBar, 默认隐藏
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setTitle:@"Second ViewController"];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"Second";
    self.navigationItem.backBarButtonItem = backItem;
    [backItem release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideOrShowToolBar:(id)sender
{
    if (self.navigationController.toolbarHidden) {
        [self.navigationController setToolbarHidden:NO animated:YES];
    } else {
        [self.navigationController setToolbarHidden:YES animated:YES];
    }
}

- (void)push:(id)sender
{
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
    [thirdVC release];
}

- (void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)hideOrShowNavigationBar:(id)sender
{
    if (self.navigationController.navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    
}

- (void)dealloc
{
    NSLog(@"secondViewController dead");
    [super dealloc];
}

@end
