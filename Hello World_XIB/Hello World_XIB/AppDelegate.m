//
//  AppDelegate.m
//  Hello World_XIB
//
//  Created by Hendy on 13-8-25.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"

int timeInt = 100;
NSDate *startDate = nil;

@interface AppDelegate ()

- (void) timerCallback:(NSTimer *)timer;
@end

@implementation AppDelegate


- (void)dealloc
{
    NSLog(@"dealloc");
    [timeLabel release];
//    [startDate release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //your code here
    NSLog(@"didFinishLaunchingWithOptions");
//    [application setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
    
    startDate = [NSDate date];
    
    //手动添加view
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
    UIView *view = [views lastObject];
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(320/2.0-100/2.0, 480/2.0-40/2.0, 100, 40)];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.text = [NSString stringWithFormat:@"%d", timeInt];
    
    [view addSubview:timeLabel];
    
    [self.window addSubview:view];

    
    //添加一个计时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerCallback:) userInfo:startDate repeats:YES];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");
    //IOS4.0以后开始支持多任务(后台),默认不调用这个
    //可以在info.pist中添加"Application does not run in background"来开启
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskAll;
}

- (void) timerCallback:(NSTimer *)timer
{
    NSDate *start = timer.userInfo;
    long interval = timeInt + [start timeIntervalSinceNow] + 0.5;
    NSLog(@"%ld", interval);
    timeLabel.text = [NSString stringWithFormat:@"%ld", interval];
    if (interval <= 0) {
        NSLog(@"timer invalidate");
        [timer invalidate];
        return;
    }
}

@end
