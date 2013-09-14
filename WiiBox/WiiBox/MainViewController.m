//
//  MainViewController.m
//  WiiBox
//
//  Created by Hendy on 13-9-10.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "ProfileViewController.h"
#import "DiscoverViewController.h"
#import "MoreViewController.h"
#import "BaseNavigationController.h"
#import "ThemeButton.h"
#import "UIFactory.h"

@interface MainViewController ()

- (void)initViewControllers;

- (void)initTabBar;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBar.hidden = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initViewControllers];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self initTabBar];
    
}

- (void)dealloc
{
    [self.tabBarView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViewControllers
{
    HomeViewController *home = [[HomeViewController alloc] init];
    MessageViewController *message = [[MessageViewController alloc] init];
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    MoreViewController *more = [[MoreViewController alloc] init];
    
    NSArray *views = @[home, message, profile, discover, more];
    NSMutableArray *naviViews = [NSMutableArray arrayWithCapacity:5];
    
    for (UIViewController *view in views) {
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:view];
        [naviViews addObject:nav];
        [nav release];
    }
    
    self.viewControllers = naviViews;
    
    [home release];
    [message release];
    [profile release];
    [discover release];
    [more release];
}

- (void)initTabBar
{
    self.tabBarView = [[UIView alloc] initWithFrame:self.tabBar.frame];
    
    //背景
    UIImage *bg = [UIImage imageNamed:@"tabbar_background"];
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.tabBarView.bounds];
    bgView.image = bg;
    [self.tabBarView addSubview:bgView];
    [bgView release];
    
    //添加TabBarItem
    NSArray *tabBarItemBgNames = @[@"tabbar_home.png", @"tabbar_message_center.png", @"tabbar_profile.png", @"tabbar_discover.png", @"tabbar_more.png"];
    NSArray *tabBarItemBgHightlightNames = @[@"tabbar_home_highlighted.png", @"tabbar_message_center_highlighted.png", @"tabbar_profile_highlighted.png", @"tabbar_discover_highlighted.png", @"tabbar_more_highlighted.png"];
    float width = self.tabBarView.bounds.size.width;
    float height = self.tabBarView.bounds.size.height;
    float offx = (width / tabBarItemBgNames.count - 30) / 2;
    for (int i = 0; i < tabBarItemBgNames.count; i++) {
        UIButton *button = [UIFactory createButton:tabBarItemBgNames[i] highlighted:tabBarItemBgHightlightNames[i]];
        button.frame = CGRectMake(offx + (30 + offx * 2) * i, (height - 30) / 2, 30, 30);
        button.tag = i;
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBarView addSubview:button];
    }
    
    [self.view addSubview:self.tabBarView];
}

- (void)selectedTab:(UIButton *)button
{
    self.selectedIndex = button.tag;
}

#pragma mark - SinaWeiboDelegate
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboDidLogIn");
    //保存认证的数据
    NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                              sinaweibo.accessToken, @"AccessTokenKey",
                              sinaweibo.expirationDate, @"ExpirationDateKey",
                              sinaweibo.userID, @"UserIDKey",
                              sinaweibo.refreshToken, @"refresh_token", nil];
    [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboDidLogOut");
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SinaWeiboAuthData"];
}
- (void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboLogInDidCancel");
}
- (void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error
{
    
}
- (void)sinaweibo:(SinaWeibo *)sinaweibo accessTokenInvalidOrExpired:(NSError *)error
{
    
}

@end
