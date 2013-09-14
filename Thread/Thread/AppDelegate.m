//
//  AppDelegate.m
//  Thread
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

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
    
    self.window.rootViewController = [[[MainViewController alloc] init] autorelease];
    
    //方式一
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(mutableThread:) object:@"thread"];
//    [thread start];    
//    [thread release];
    
    //方式二
//    [NSThread detachNewThreadSelector:@selector(mutableThread:) toTarget:self withObject:nil];

    
    //方式三
//    [self performSelectorInBackground:@selector(mutableThread:) withObject:nil];
    
    
    //方式四
//    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
//    [operationQueue addOperationWithBlock:^{
//        for (int i = 0; i < 100; i++) {
//            NSLog(@"多Thread===%d", i);
//        }
//    }];
//    [operationQueue release];

    
    //方式五---线程池
//    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
//    NSInvocationOperation *operation = [[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(mutableThread:) object:@"线程1"] autorelease];
//    NSInvocationOperation *operation2 = [[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(mutableThread:) object:@"线程2"] autorelease];
//    operation2.queuePriority = NSOperationQueuePriorityHigh;
//    operationQueue.maxConcurrentOperationCount = 2;
//    [operationQueue addOperation:operation];
//    [operationQueue addOperation:operation2];
//    [operationQueue release];
    
    //方式六---GCD
    dispatch_queue_t queue = dispatch_queue_create("test", NULL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"===%d", i);
        }
        
        if ([NSThread isMultiThreaded]) {
            NSLog(@"Yes, I'm multi thread");
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if ([NSThread isMainThread]) {
                NSLog(@"Yes, I'm main thread");
            }
        });
    });
    
    
//    for (int i = 0; i < 100; i++) {
//        NSLog(@"主Thread---%d", i);
//    }
    NSLog(@"Main : %p", [NSThread currentThread]);
    return YES;
}

- (void)mutableThread:(NSString *)obj
{
    NSLog(@"%@ : %p", obj, [NSThread currentThread]);
    for (int i = 0; i < 100; i++) {
        NSLog(@"%@===%d", obj, i);
    }
}


@end
