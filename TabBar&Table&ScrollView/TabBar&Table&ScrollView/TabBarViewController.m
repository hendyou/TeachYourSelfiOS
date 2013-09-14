//
//  TabBarViewController.m
//  TabBar&Table&ScrollView
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "TabBarViewController.h"
#import "Tab1TableViewController.h"
#import "Tab2TableViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        Tab1TableViewController *tab1 = [[Tab1TableViewController alloc] initWithStyle:UITableViewStylePlain];
        Tab2TableViewController *tab2 = [[Tab2TableViewController alloc] initWithStyle:UITableViewStylePlain];
        UINavigationController *naviController1 = [[UINavigationController alloc] initWithRootViewController:tab1];
        UINavigationController *naviController2 = [[UINavigationController alloc] initWithRootViewController:tab2];
        NSArray *viewControllers = @[naviController1, naviController2];
        
        //设置tabitems
        UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"ScrollView分页" image:nil tag:1];
        naviController1.tabBarItem = item1;
        [item1 release];
        
        UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"ScrollView缩放" image:nil tag:2];
        naviController2.tabBarItem = item2;
        [item2 release];
        
        
        [tab1 release];
        [tab2 release];
        [naviController1 release];
        [naviController2 release];
        
        self.viewControllers = viewControllers;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
