//
//  AppDelegate.m
//  TabBarController
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "MyTabBarViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
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
    
    MyTabBarViewController *tabBarController = [[MyTabBarViewController alloc] init];
//    tabBarController.viewControllers = @[vc1, vc2, vc3, vc4];
    [tabBarController setViewControllers:@[vc1, vc2, vc3, navController, vc5, vc6, navVC7] animated:YES];
    tabBarController.delegate = self;
    
    [vc1 release];
    [vc2 release];
    [vc3 release];
    [vc4 release];
    [navController release];
    [vc5 release];
    [vc6 release];
    [vc7 release];
    [navVC7 release];
    
    
    self.window.rootViewController = tabBarController;
    
    [tabBarController release];
    
    return YES;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"shouldSelectViewController: %@", viewController);
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"didSelectViewController: %@", viewController);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
