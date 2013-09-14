//
//  RootViewController.m
//  ModalViewController
//
//  Created by Hendy on 13-8-27.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "RootViewController.h"
#import "ModalViewController.h"

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

- (void)viewDidLoad
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"present" forState:UIControlStateNormal];
    button.frame = CGRectMake(160 - 50, 50, 100, 40);
    [button addTarget:self action:@selector(presentModalVC) forControlEvents:UIControlEventTouchUpInside];
    
	[view addSubview:button];
    
    self.view = view;
    
    [view release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentModalVC
{
    ModalViewController *modal = [[ModalViewController alloc] init];
//    modal.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    modal.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    //判断系统版本
    float version = [[UIDevice currentDevice].systemVersion floatValue];
    NSLog(@"version: %.2f", version);
    if (version < 5.0) {
        [self presentModalViewController:modal animated:YES];
        NSLog(@"presentModalViewController");
    } else {
        [self presentViewController:modal animated:YES completion:^{
            NSLog(@"presentViewController");
        }];
    }
    [modal release];
}

@end
