//
//  BaseNavigationController.m
//  WiiBox
//
//  Created by Hendy on 13-9-10.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManager.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChangedNotification:) name:kThemeDidChangedNofication object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadThemeImage];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangedNofication object:nil];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)themeChangedNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}

- (void)loadThemeImage
{
    if (WXHLOSVersion() >= 5.0) {
        UIImage *bg = [[ThemeManager shareThemeManager] themeImage:@"navigationbar_background.png"];
        [self.navigationBar setBackgroundImage:bg forBarMetrics:UIBarMetricsDefault];
    } else {
        //让渲染引擎异步调用draw方法
        [self.navigationBar setNeedsDisplay];
    }
}

@end
