//
//  AppDelegate.m
//  RunLoop
//
//  Created by Hendy on 13-9-6.
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
    
    [self performSelectorInBackground:@selector(multiThread) withObject:nil];
    
    return YES;
}

- (void)multiThread
{
    @autoreleasepool {
        //NSTimer最好在多线程中运行(要加上RunLoop), 这样计时才比较精确
//        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
    }
    NSLog(@"线程结束");
}

int count = 0;
- (void)timerAction:(NSTimer *)timer
{
    NSLog(@"线程运行~");
    if (count++ > 3) {
        [timer invalidate];
    }
}

@end
