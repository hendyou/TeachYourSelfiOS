//
//  AppDelegate.m
//  Label
//
//  Created by Hendy on 13-8-28.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"

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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(160 - 100, 100, 200, 40)];
    
    label.text = @"I'm a UILabel! hahahahahasdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff";
    
    label.backgroundColor = [UIColor purpleColor];
    
    label.textColor = [UIColor yellowColor];
    
    label.textAlignment = NSTextAlignmentCenter; //文字对齐
    
    label.shadowColor = [UIColor whiteColor]; //阴影
    
    label.shadowOffset = CGSizeMake(1, 1); //阴影偏移
    
    label.lineBreakMode = NSLineBreakByTruncatingMiddle; //"..."的位置
    
    label.font = [UIFont systemFontOfSize:14];
    
    label.numberOfLines = 0;
    
    [label sizeToFit]; //根据文字自动调整大小
    
    [self.window addSubview:label];
    [label release];
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

@end
