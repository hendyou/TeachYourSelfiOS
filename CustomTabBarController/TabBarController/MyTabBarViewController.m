//
//  MyTabBarViewController.m
//  TabBarController
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "DetailViewController.h"

@interface MyTabBarViewController ()
@end

int selectedSpace = 0;
UIImageView *selectedView;
UIImageView *tabBarGB;

@implementation MyTabBarViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)loadViewController
{
    /*
     1.子ViewController是并列关系
     2.创建一个UITabBarViewController
     3.把子ViewController放到UITabBarViewController里
     */
    
    FirstViewController *vc1 = [[FirstViewController alloc] init];
    
    SecondViewController *vc2 = [[SecondViewController alloc] init];
    vc2.title = @"新闻";
    vc2.view.backgroundColor = [UIColor whiteColor];
    
    ThirdViewController *vc3 = [[ThirdViewController alloc] init];
    vc3.title = @"搜索";
    vc3.view.backgroundColor = [UIColor cyanColor];
    
    FourViewController *vc4 = [[FourViewController alloc] init];
    vc4.title = @"设置";
    vc4.view.backgroundColor = [UIColor purpleColor];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vc4];
    navController.title = @"导航";
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.title = @"音乐";
    vc5.view.backgroundColor = [UIColor grayColor];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.title = @"电影";
    vc6.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.title = @"色情+++";
    vc7.view.backgroundColor = [UIColor yellowColor];
    
    UINavigationController *navVC7 = [[UINavigationController alloc] initWithRootViewController:vc7];
    navVC7.title = @"色情";
    
    DetailViewController *vcDetail = [[DetailViewController alloc] init];
    
    self.viewControllers = @[vc1, vc2, vc3, navController, vcDetail];
    //    [self setViewControllers:@[vc1, vc2, vc3, navController, vc5, vc6, navVC7] animated:YES];
    
    [vc1 release];
    [vc2 release];
    [vc3 release];
    [vc4 release];
    [navController release];
    [vc5 release];
    [vc6 release];
    [vc7 release];
    [navVC7 release];
    [vcDetail release];
}

- (void)loadCustomTabBar
{
    tabBarGB = [[UIImageView alloc] initWithFrame:CGRectMake(0, 431, 320, 49)];
    tabBarGB.userInteractionEnabled = YES;
    tabBarGB.image = [UIImage imageNamed:@"tabbar_bg"];
    [self.view addSubview:tabBarGB];
    [tabBarGB release];
    
    selectedView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selected_bg"]];
    selectedSpace = (320 - 53 * self.viewControllers.count) * 1.0 / self.viewControllers.count;
    selectedView.frame = CGRectMake(selectedSpace/2.0 + 3 * 53 + selectedSpace * 3, 49/2.0 - 45/2.0, 53, 45);
    [tabBarGB addSubview:selectedView];
    
    
    float space = (320 - 42 * self.viewControllers.count) * 1.0 / self.viewControllers.count;
    //初始化自定义TabBarItem
    for (int index = 0; index < self.viewControllers.count; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = index;
        button.frame = CGRectMake(space / 2.0 + index * 42 + space * index, 49/2.0 - 20, 42, 40);
        [button setBackgroundImage:[UIImage imageNamed:@"monster1"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarGB addSubview:button];
    }
}

- (void)changeViewController:(UIButton *)sender
{
    self.selectedIndex = sender.tag;
//    [UIView animateWithDuration:0.2 animations:^{
//        
//        selectedView.frame = CGRectMake(selectedSpace/2.0 + self.selectedIndex * 53 + selectedSpace * self.selectedIndex, 49/2.0 - 45/2.0, 53, 45);
//    }];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    selectedView.frame = CGRectMake(selectedSpace/2.0 + self.selectedIndex * 53 + selectedSpace * self.selectedIndex, 49/2.0 - 45/2.0, 53, 45);
    [UIView commitAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadViewController];
    
    self.selectedIndex = 3;
    
    [self loadCustomTabBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [selectedView release];
    [super dealloc];
}

- (void)showTabBar
{
//    tabBarGB.hidden = NO;
    [UIView animateWithDuration:0.35 animations:^{
        
        tabBarGB.frame = CGRectMake(0, 431, 320, 49);
    }];

}
- (void)hiddenTabBar
{
//    tabBarGB.hidden = YES;
    [UIView animateWithDuration:0.35 animations:^{
        tabBarGB.frame = CGRectMake(-320, 431, 320, 49);
    }];
}

@end
