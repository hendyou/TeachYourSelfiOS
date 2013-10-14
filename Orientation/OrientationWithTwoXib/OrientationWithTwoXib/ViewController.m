//
//  ViewController.m
//  OrientationWithTwoXib
//
//  Created by Hendy on 13-10-14.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    CGRect rect = [[UIScreen mainScreen] bounds];
    NSLog(@"%@", NSStringFromCGRect(rect));
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [UIView animateWithDuration:duration animations:^{
            self.view = self.landscapeView;
            self.view.transform = CGAffineTransformMakeRotation(deg2rad(90));
            self.view.bounds = CGRectMake(0, 0, rect.size.height, rect.size.width);
            
        }];
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        [UIView animateWithDuration:duration animations:^{
            self.view = self.landscapeView;
            self.view.transform = CGAffineTransformMakeRotation(deg2rad(-90));
            self.view.bounds = CGRectMake(0, 0, rect.size.height, rect.size.width);
        }];
    } else {
        [UIView animateWithDuration:duration animations:^{
            self.view = self.protraitView;
            self.view.transform = CGAffineTransformMakeRotation(deg2rad(0));
            self.view.bounds = CGRectMake(0, 0, rect.size.width, rect.size.height);
        }];
    }
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

float deg2rad(float degree)
{
    return degree * M_PI / 180;
}

@end
