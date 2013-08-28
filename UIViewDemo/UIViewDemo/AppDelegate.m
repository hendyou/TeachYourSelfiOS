//
//  AppDelegate.m
//  UIViewDemo
//
//  Created by Hendy on 13-8-26.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"
#import "MyView.h"

UIView *view;
UIView *view2;

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
    
    
    view = [[UIView alloc] initWithFrame:CGRectMake(60, 200, 200, 100)];
    view.backgroundColor = [UIColor blueColor];
    view.alpha = 0.5;
    view.tag = 1;
    
    [self.window addSubview:view];
    
    [view release];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(110, 225, 100, 150)];
    view2.backgroundColor = [UIColor redColor];
    view2.tag = 2;
    [self.window addSubview:view2];
    [view2 release];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view3.backgroundColor = [UIColor greenColor];
    [view addSubview:view3];
    [view3 release];
    
    MyView *view4 = [[MyView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view4.backgroundColor = [UIColor blackColor];
    [view2 addSubview:view4];
    [view4 release];
    
    NSLog(@"window subviews: %@", self.window.subviews);
    
    //视图管理
    [self.window bringSubviewToFront:view];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(160 - 50, 480 - 60, 100, 40)];
    [button setTitle:@"exchange" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(exchange) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(160 - 50, 40, 100, 40)];
    [button2 setTitle:@"hide" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button2];
    
    return YES;
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

- (void)exchange
{
    int indexView1 = [[self.window subviews] indexOfObject:[self.window viewWithTag:1]];
    int indexView2 = [[self.window subviews] indexOfObject:[self.window viewWithTag:2]];
    [self.window exchangeSubviewAtIndex:indexView1 withSubviewAtIndex:indexView2];
}

- (void)hide
{
    view.hidden = !view.hidden;
}

@end
