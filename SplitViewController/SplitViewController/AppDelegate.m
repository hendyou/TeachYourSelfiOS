//
//  AppDelegate.m
//  SplitViewController
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"

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
    
    UISplitViewController *splitViewController = [[UISplitViewController alloc] init];
    MasterViewController *master = [[MasterViewController alloc] init];
    DetailViewController *detail = [[DetailViewController alloc] init];
    UINavigationController *naviMaster = [[UINavigationController alloc] initWithRootViewController:master];
    UINavigationController *naviDetail = [[UINavigationController alloc] initWithRootViewController:detail];
    
    splitViewController.viewControllers = @[naviMaster, naviDetail];
    
    self.window.rootViewController = splitViewController;
    
    [splitViewController release];
    [master release];
    [detail release];
    [naviMaster release];
    [naviDetail release];
    
    splitViewController.delegate = self;
    splitViewController.presentsWithGesture = YES;
    
    
    return YES;
}

#pragma mark - Split view controller delegate
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    NSLog(@"Master view controller will hide");
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSLog(@"Master view controller will show");
}

// Called when the view controller is shown in a popover so the delegate can take action like hiding other popovers.
- (void)splitViewController:(UISplitViewController *)svc popoverController:(UIPopoverController *)pc willPresentViewController:(UIViewController *)aViewController
{
    NSLog(@"Master view controller will show in a popver");
}

//- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation NS_AVAILABLE_IOS(5_0)
//{
//    return NO;
//}

@end
