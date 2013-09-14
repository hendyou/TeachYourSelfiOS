//
//  AppDelegate.m
//  NetDataServer
//
//  Created by Hendy on 13-9-7.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"
#import "MyDataService.h"

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
    button.frame = CGRectMake(30, 40, 100, 40);
    [button setTitle:@"获取天气" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadWeather) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 80)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor cyanColor];
    label.tag = 0x1;
    
    [self.window addSubview:label];
    [label release];
    
    return YES;
}

- (void)loadWeather
{
    NSDictionary *params = @{@"cityCode": @"101010300"};
    [MyDataService getWeatherData:params block:^(id data) {
        NSLog(@"%@ : %@", [data class], data);
        NSDictionary *dic = (NSDictionary *)data;
        NSDictionary *weatherInfo = dic[@"weatherinfo"];
        UILabel *label = (UILabel *)[self.window viewWithTag:0x1];
        label.text = [NSString stringWithFormat:@"城市:%@  温度:%@度", weatherInfo[@"city"], weatherInfo[@"temp"]];
    }];
}

@end
