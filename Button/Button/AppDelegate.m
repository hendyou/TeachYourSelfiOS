//
//  AppDelegate.m
//  Button
//
//  Created by Hendy on 13-8-27.
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
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.tag = 999;
    [button setTitle:@"Normal" forState:UIControlStateNormal];
    [button setTitle:@"HighLight" forState:UIControlStateHighlighted];
    [button setTitle:@"Disabled" forState:UIControlStateDisabled];
    [button setTitle:@"Selected" forState:UIControlStateSelected];
    button.frame = CGRectMake(160 - 60, 50, 120, 40);
    
//    button.enabled = NO;//禁用按钮
    
//    button.selected = YES;//按钮选中
    
    //自定义背景
    UIEdgeInsets insets = UIEdgeInsetsMake(12.0, 12.0, 12.0, 12.0);
    UIImage *normalImage = [[UIImage imageNamed: @"whiteButton.png"] resizableImageWithCapInsets: insets resizingMode: UIImageResizingModeStretch];
    UIImage *pressedImage = [[UIImage imageNamed: @"blueButton.png"] resizableImageWithCapInsets: insets resizingMode: UIImageResizingModeStretch];
    
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonTouchUpInside:events:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(dragEnter) forControlEvents:UIControlEventTouchDragEnter];
    [button addTarget:self action:@selector(dragExit) forControlEvents:UIControlEventTouchDragExit];
    [button addTarget:self action:@selector(touchCancel) forControlEvents:UIControlEventTouchCancel];
    
    [self.window addSubview:button];
    
    //选择按钮
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    selectBtn.tag = 123;
    selectBtn.frame = CGRectMake(160 - 60, 120, 120, 40);
    
    [selectBtn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [selectBtn setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
    [selectBtn setBackgroundImage:pressedImage forState:UIControlStateSelected];
    
    [selectBtn addTarget:self action:@selector(buttonTouchUpInside:events:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:selectBtn];
    
    return YES;
}

- (void)buttonTouchUpInside:(UIButton *)button events:(UIControlEvents) events
{
//    NSLog(@"%d, event: %d", button.tag, events);
    NSLog(@"TouchUpInside");
    if (button.tag == 123) {
        if (button.isSelected) {
            button.selected = NO;
        } else {
            button.selected = YES;
        }
    }
}

- (void)dragExit
{
    NSLog(@"dragExit");
}

- (void)dragEnter
{
    NSLog(@"dragEnter");
}

- (void)touchCancel
{
    NSLog(@"touchCancel");
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
