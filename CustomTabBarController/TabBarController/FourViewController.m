//
//  FourViewController.m
//  TabBarController
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "FourViewController.h"
#import "OtherViewController.h"
#import "MyTabBarViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

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
    self.title = @"设置navi";
    UIBarButtonItem *navRight = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleBordered target:self action:@selector(next)];
    self.navigationItem.rightBarButtonItem = navRight;
    [navRight release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [((MyTabBarViewController *)self.tabBarController) showTabBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)next
{
    OtherViewController *viewController = [[OtherViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

@end
