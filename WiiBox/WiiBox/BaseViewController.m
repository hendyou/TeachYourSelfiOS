//
//  BaseViewController.m
//  WiiBox
//
//  Created by Hendy on 13-9-10.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomCatagory.h"
#import "AppDelegate.h"
#import "UIFactory.h"
#import "ThemeManager.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

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
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count > 1) {
        //返回键
        UIButton *backBtn = [UIFactory createButton:@"navigationbar_back.png" highlighted:@"navigationbar_back_highlighted.png"];
        backBtn.frame = CGRectMake(0, 0, 24, 24);
        [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];

        self.navigationItem.leftBarButtonItem = backItem;
        [backItem release];
        
        
        //主页键
        UIButton *homeBtn = [UIFactory createButton:@"tabbar_home.png" highlighted:@"tabbar_home_highlighted.png"];
        homeBtn.frame = CGRectMake(0, 0, 30, 30);
        [homeBtn addTarget:self action:@selector(homeClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *homeItem = [[UIBarButtonItem alloc] initWithCustomView:homeBtn];
        
        self.navigationItem.rightBarButtonItem = homeItem;
        [homeItem release];
    }
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if (self.tabBarController != nil && self.navigationController.viewControllers.count > 1) {
        self.view.height += self.tabBarController.tabBar.height;
    }
}

- (SinaWeibo *)sinaweibo
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}

- (AppDelegate *)appDelegate
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate;
}

//overide
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    UILabel *titleLabel = [UIFactory createLabel:kNavigationBarTitleLabel];
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    [titleLabel sizeToFit];
    
    self.navigationItem.titleView = titleLabel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - On click
- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)homeClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
