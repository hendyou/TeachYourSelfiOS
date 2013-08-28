//
//  AppDelegate.m
//  UIViewTransform
//
//  Created by Hendy on 13-8-26.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

- (void)timerCallback:(NSTimer *)timer;

@end

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [start release];
    [colors release];
    [view release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    start = [[NSDate date] retain];
    colors = @[[UIColor redColor],
               [UIColor orangeColor],
               [UIColor yellowColor],
               [UIColor greenColor],
               [UIColor cyanColor],
               [UIColor blueColor],
               [UIColor purpleColor]];
    [colors retain];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(160 - 100, 240 - 100, 200, 200)];
    view.backgroundColor = [colors objectAtIndex:0];
    [self.window addSubview:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width/2.0 - 50/2.0, 20, 50, 20)];
    label.text = @"Hi~~";
    [view addSubview:label];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerCallback:) userInfo:nil repeats:YES];
    
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

- (void)timerCallback:(NSTimer *)timer
{
    //旋转&变色
    static int round = 0;
    view.backgroundColor = [colors objectAtIndex:++round];
    if (round == colors.count - 1) {
        round = 0;
    }
    
    view.transform = CGAffineTransformRotate(view.transform, 2*M_PI/10);
    
    long interval = 10 + [start timeIntervalSinceNow] + 0.5;
    NSLog(@"%ld", interval);
    if (interval <= 0) {
        [timer invalidate];
        [view removeFromSuperview];
    }
}

@end
