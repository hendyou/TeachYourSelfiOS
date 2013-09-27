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
        UIButton *backBtn = [UIFactory createButton:@"navigationbar_back.png" highlighted:@"navigationbar_back_highlighted.png"];
        backBtn.frame = CGRectMake(0, 0, 24, 24);
        [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];

        self.navigationItem.leftBarButtonItem = backItem;
        [backItem release];
        
    }
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if (self.tabBarController != nil && self.navigationController.viewControllers.count > 1) {
        self.view.height += self.tabBarController.tabBar.height;
    }
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (SinaWeibo *)sinaweibo
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
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

@end