//
//  AppDelegate.m
//  Animation
//
//  Created by Hendy on 13-8-26.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [imageView release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"monster2"]];
    imageView.frame = CGRectMake(35, 50, 250, 250);
    imageView.clipsToBounds = YES;
    imageView.backgroundColor = [UIColor redColor];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    imageView.contentMode = UIViewContentModeCenter;
//    imageView.contentMode = UIViewContentModeScaleToFill; //default
    
    UIButton *rotateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rotateBtn.frame = CGRectMake(20, 420, 80, 40);
    [rotateBtn setTitle:@"rotate" forState:UIControlStateNormal];
    [rotateBtn addTarget:self action:@selector(rotate) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *zoomInBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    zoomInBtn.frame = CGRectMake(120, 420, 80, 40);
    [zoomInBtn setTitle:@"zoom in" forState:UIControlStateNormal];
    [zoomInBtn addTarget:self action:@selector(zoomIn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *zoomOutBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    zoomOutBtn.frame = CGRectMake(220, 420, 80, 40);
    [zoomOutBtn setTitle:@"zoom out" forState:UIControlStateNormal];
    [zoomOutBtn addTarget:self action:@selector(zoomOut) forControlEvents:UIControlEventTouchUpInside];
    
    [self.window addSubview:imageView];
    [self.window addSubview:rotateBtn];
    [self.window addSubview:zoomInBtn];
    [self.window addSubview:zoomOutBtn];
    
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

- (void)rotate
{
    [UIView animateWithDuration:2 animations:^{
        imageView.transform = CGAffineTransformRotate(imageView.transform, M_PI);
//        imageView.alpha = 0.2;
    }];
}

- (void)zoomIn
{
    //    [UIView animateWithDuration:1 animations:^{
    //        imageView.transform = CGAffineTransformScale(imageView.transform, 2.0, 2.0);
    //    }];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.transform = CGAffineTransformScale(imageView.transform, 2.0, 2.0);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)zoomOut
{
//    [UIView animateWithDuration:1 animations:^{
//        imageView.transform = CGAffineTransformScale(imageView.transform, 0.5, 0.5);
//    }];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.transform = CGAffineTransformScale(imageView.transform, 0.5, 0.5);
    } completion:^(BOOL finished) {
        
    }];
}

@end
