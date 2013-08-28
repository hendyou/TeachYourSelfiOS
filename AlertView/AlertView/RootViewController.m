//
//  RootViewController.m
//  ModalViewController
//
//  Created by Hendy on 13-8-27.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "RootViewController.h"
#import "ModalViewController.h"
#import "MyAlertView.h"

#define ButtonTag 100

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
    button.tag = ButtonTag;
    [button setTitle:@"present" forState:UIControlStateNormal];
    button.frame = CGRectMake(160 - 50, 50, 100, 40);
    [button addTarget:self action:@selector(presentModalVC) forControlEvents:UIControlEventTouchUpInside];
    
	[view addSubview:button];
    
    UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [alertBtn setTitle:@"Show AlertView" forState:UIControlStateNormal];
    alertBtn.frame = CGRectMake(160 - 80, 120, 160, 40);
    [alertBtn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:alertBtn];
    
    self.view = view;
    
    [view release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showAlert
{
    MyAlertView *alert = [[MyAlertView alloc] initWithTitle:@"Title" message:@"message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
    alert.tag = 101;
//    [alert autorelease];
    [alert show];
    
    [alert release];
}

- (void)presentModalVC
{
    ModalViewController *modal = [[ModalViewController alloc] init];
//    modal.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    modal.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    //判断系统版本
    float version = [[UIDevice currentDevice].systemVersion floatValue];
    if (version < 6.0) {
        [self presentModalViewController:modal animated:YES];
    } else {
        [self presentViewController:modal animated:YES completion:^{
        }];
    }
    [modal release];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    UIView *button = [self.view viewWithTag:ButtonTag];
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait
        || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        button.frame = CGRectMake(160 - 50, 50, 100, 40);
    } else {
        button.frame = CGRectMake(240 - 50, 50, 100, 40);
    }
}

#pragma mark - orientation BEFORE 6.0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

#pragma mark - orientation BEFORE 6.0
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - UIAlertView Delegate
- (void)alertViewCancel:(UIAlertView *)alertView
{
    NSLog(@"alertViewCancel");
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Cancel");
            break;
        case 1:
            NSLog(@"Confirm");
            break;
            
        default:
            break;
    }
}

@end
