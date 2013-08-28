//
//  ViewController.m
//  Scroller
//
//  Created by Hendy on 13-3-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    NSLog(@"loadView");
    [super loadView];
}

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear: animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear");
    [super viewDidDisappear:animated];
    self.scrollViewOffset = self.theScroller.contentOffset;
}

- (void)viewDidLayoutSubviews
{
    NSLog(@"viewDidLayoutSubviews");
    [super viewDidLayoutSubviews];
    //旋屏后,恢复中间位置
    self.theScroller.contentOffset = CGPointMake(self.scrollViewOffset.x, self.scrollViewOffset.y - self.theScroller.frame.size.height/2);
    //因为IOS6后默认使用了autoLayout,在viewDidLoad方法后执行调整布局的代码,导致contentSize无效,所以不能写在这个方法里;
    //网上说,把contentSize的代码写在viewDidAppear方法里以解决此问题,的确可以,但在旋屏后又被自动调整了;
    //因为旋屏时会执行viewWillLayoutSubviews和viewDidLayoutSubviews方法,所以写在这里可以同时解决滚动和旋屏问题.
    self.theScroller.contentSize = CGSizeMake(280, 610);
}

- (void)viewWillLayoutSubviews
{
    NSLog(@"viewWillLayoutSubviews");
    [super viewWillLayoutSubviews];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //旋屏前,记录中间位置
    self.scrollViewOffset = CGPointMake(self.theScroller.contentOffset.x, self.theScroller.contentOffset.y + self.theScroller.frame.size.height/2);
}

@end
