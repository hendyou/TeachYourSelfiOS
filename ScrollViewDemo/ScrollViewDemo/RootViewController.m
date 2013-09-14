//
//  RootViewController.m
//  ScrollViewDemo
//
//  Created by Hendy on 13-9-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "RootViewController.h"

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    //设置内容大小
    scrollView.contentSize = CGSizeMake(320 * 5, 250 * 5);
    //设置是否反弹
//    scrollView.bounces = NO;
    //设置分布效果
//    scrollView.pagingEnabled = YES;
    //设置滚动
//    scrollView.scrollEnabled = NO;
    //设置显示水平/垂直indicator
//    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    //设置indicator风格
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    //提示用户indicator(显示indicator一段时间)
    [scrollView flashScrollIndicators];
    //设置padding
    scrollView.contentInset = UIEdgeInsetsMake(0, 50, 0, 0);
    //indicator padding
//    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    //方向锁
    scrollView.directionalLockEnabled = YES;
    
    scrollView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:scrollView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 200, 100)];
    label.text = @"学习scrollView";
    [scrollView addSubview:label];
    [label release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(160 - 70, 350, 140, 40);
    [button setTitle:@"定位" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction
{
    //移动到指定位置
//    [scrollView setContentOffset:CGPointMake(0, 200)];
    [scrollView scrollRectToVisible:CGRectMake(0, 200, 320, 250) animated:YES];
}

- (void)dealloc
{
    [scrollView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
