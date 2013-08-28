//
//  RootViewController.m
//  ModalViewController
//
//  Created by Hendy on 13-8-27.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "RootViewController.h"
#import "ModalViewController.h"

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
    
    self.view = view;
    
    [view release];
    
    
    //也可以通过Notification来获取旋转屏幕通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientation:) name:UIDeviceOrientationDidChangeNotification object:nil];
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
    if (version < 6.0) {
        [self presentModalViewController:modal animated:YES];
    } else {
        [self presentViewController:modal animated:YES completion:^{
        }];
    }
    [modal release];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willAnimateRotationToInterfaceOrientation");

}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willRotateToInterfaceOrientation");
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
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)deviceOrientation:(NSNotification *)notification
{
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    NSLog(@"device orientation: %d", orientation);
}

@end
