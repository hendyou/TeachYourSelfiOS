//
//  MainViewController.m
//  UIViewAnimation
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

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

- (void)dealloc {
    [_myView release];
    [_parentView release];
    [super dealloc];
}
- (IBAction)startAnim:(UIButton *)sender {
    //传统的方式
    [UIView beginAnimations:@"testAnimation" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:1.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    CGRect frame = self.myView.frame;
    frame.origin.y = 400;
    self.myView.frame = frame;
    
    [UIView commitAnimations];
    
    //新方式-Block
//    [UIView animateWithDuration:0.5 animations:^{
//        self.myView.alpha = 0.3;
//        CGRect frame = self.myView.frame;
//        frame.origin.y = 120;
//        self.myView.frame = frame;
//    }];
    
    //Block结束回调
//    [UIView animateWithDuration:0.5 animations:^{
//        self.myView.transform = CGAffineTransformScale(self.myView.transform, 0.1, 0.1);
//        self.myView.alpha = 0.3;
//        CGRect frame = self.myView.frame;
//        frame.origin.y = 400;
//        self.myView.frame = frame;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.8 animations:^{
//            //            self.myView.transform = CGAffineTransformScale(self.myView.transform, 10, 10);
//            self.myView.transform = CGAffineTransformIdentity;
//            self.myView.alpha = 1;
//            CGRect frame = self.myView.frame;
//            frame.origin.y = 120;
//            self.myView.frame = frame;
//        }];
//    }];
}

- (IBAction)transitionAction:(UIButton *)sender {
//    [UIView animateWithDuration:0.5 animations:^{
//        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.parentView cache:YES];
//    }];
//    [self.parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    
//    [UIView animateWithDuration:1 animations:^{
//        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:YES];
//    }];
//    UIViewController *viewCtrl = [[[UIViewController alloc] init] autorelease];
//    [self.navigationController pushViewController:viewCtrl animated:NO];
    
    
    [UIView transitionWithView:self.navigationController.view duration:0.5 options:UIViewAnimationOptionTransitionCurlUp |UIViewAnimationOptionCurveLinear animations:^{
    } completion:nil];
    UIViewController *viewCtrl = [[[UIViewController alloc] init] autorelease];
    [self.navigationController pushViewController:viewCtrl animated:NO];
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID isEqualToString:@"testAnimation"] && [finished boolValue]) {
        //新方式-Block
        [UIView animateWithDuration:0.5 animations:^{
            self.myView.alpha = 1;
            CGRect frame = self.myView.frame;
            frame.origin.y = 120;
            self.myView.frame = frame;
        }];
    }
}
@end
