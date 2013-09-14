//
//  AppDelegate.m
//  ASIHttpDownload
//
//  Created by Hendy on 13-9-9.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"
#import "ASIHTTPRequest.h"
#import "Reachability.h"

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
    
    //进度条
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.tag = 100;
    progressView.frame = CGRectMake(50, 100, 200, 20);
    [self.window addSubview:progressView];
    
    [progressView addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(160 - 50, 180, 100, 40);
    [button setTitle:@"下载" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    
    //kReachabilityChangedNotification 网络状态改变时触发的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeNetWork) name:kReachabilityChangedNotification object:nil];
    self.reachability = [Reachability reachabilityForInternetConnection];
    //开始监听网络
    [self.reachability startNotifier];
    NetworkStatus netStatus = self.reachability.currentReachabilityStatus;
    [self checkNetWork:netStatus];
    
    return YES;
}

- (void)download
{
    UIProgressView *progressView = (UIProgressView *)[self.window viewWithTag:100];
    
    //-----------------ASI Download-------------
    NSString *url = @"http://down.sandai.net/mac/Thunder1.1.1.138.dmg";
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Download"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *fileName = [url lastPathComponent];
    path = [path stringByAppendingPathComponent:fileName];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request setDownloadDestinationPath:path];
    request.downloadProgressDelegate = progressView;
    
    [request setHeadersReceivedBlock:^(NSDictionary *responseHeaders) {
        NSLog(@"Headers : %@", responseHeaders);
    }];
    
    [request setDownloadSizeIncrementedBlock:^(long long size) {
        NSLog(@"receive size : %lld", size);
    }];
    
    [request setCompletionBlock:^{
        NSLog(@"Done!!");
    }];
    
    [request startAsynchronous];
    [request setShouldContinueWhenAppEntersBackground:YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSNumber *value = change[@"new"];
    float progress = [value floatValue];
    NSLog(@"%.1f%%", progress * 100);
}

- (void)changeNetWork:(NSNotification *)notification
{
    NetworkStatus netStatus = self.reachability.currentReachabilityStatus;
    [self checkNetWork:netStatus];
}

- (void) checkNetWork:(NetworkStatus)status
{
    NSString *state = nil;
    switch (status) {
        case NotReachable:
            state = @"无网络";
            break;
        case ReachableViaWiFi:
            state = @"WiFi可用";
            break;
        case ReachableViaWWAN:
            state = @"3G可用";
            break;
            
        default:
            break;
    }
    NSLog(@"%@", state);
}

@end
