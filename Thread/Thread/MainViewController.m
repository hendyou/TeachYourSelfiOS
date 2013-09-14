//
//  MainViewController.m
//  Thread
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, 200, 50)];
    
    [self.view addSubview:_label];
    
//    [self performSelectorInBackground:@selector(mutableThread:) withObject:nil];
    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}

static int count = 1;
- (void)timerAction:(NSTimer *) timer
{
    //Timer执行的方法是在Main线程进行, 打印出来的线程地址和主线程相同
    NSLog(@"Timer : %p", [NSThread currentThread]);
    
    _label.text = [NSString stringWithFormat:@"%d", count++];

    if (count > 5) {
        [timer invalidate];
    }
}

- (void)mutableThread:(id) info
{
    //Timer执行的方法是在Main线程进行, 打印出来的线程地址和主线程相同
    NSLog(@"Thread : %p", [NSThread currentThread]);
    for (int i = 1; i < 100; i++) {
        if (i == 7) {
            [NSThread exit];
        }
        [NSThread sleepForTimeInterval:1];
        //跳回Main线程更新UI(因为UI都是在Main线程中)
        [self performSelectorOnMainThread:@selector(updateLabel) withObject:nil waitUntilDone:NO];
    }

}

- (void)updateLabel
{
    _label.text = [NSString stringWithFormat:@"%d", count++];
}

- (void)dealloc
{
    [_label release];
    [super dealloc];
}

@end
