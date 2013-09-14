//
//  MainViewController.m
//  CATransition
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)transtionAction:(UIButton *)sender {
    CATransition *anim = [CATransition animation];
    anim.duration = 0.6;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
//    anim.type = kCATransitionPush;
//    anim.subtype = kCATransitionFromRight;
    
    //私有api
    anim.type = @"suckEffect";
    
    //View之间的动画切换
//
//    [self.myView .layer addAnimation:anim forKey:nil];
//    
//    [self.myView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    
    [self.navigationController.view.layer addAnimation:anim forKey:nil];
    UIViewController *viewCtrl = [[UIViewController alloc] init];
    [self.navigationController pushViewController:viewCtrl animated:NO];
}
- (void)dealloc {
    [_myView release];
    [super dealloc];
}
@end
