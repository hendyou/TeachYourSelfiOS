//
//  TouchViewController.m
//  TouchGesture
//
//  Created by Hendy on 13-9-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "TouchViewController.h"

@interface TouchViewController ()

@end

@implementation TouchViewController

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
    
    //单击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
    [tap release];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    [doubleTap release];
    
    //区别单击和双击手势
    [tap requireGestureRecognizerToFail:doubleTap];
    
    //猛扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
    [swipe release];
    
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    [swipe release];
    
    //滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    [pan release];
    
    //长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.view addGestureRecognizer:longPress];
    [longPress release];
    
    //旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [self.view addGestureRecognizer:rotation];
    [rotation release];
}

- (void)tap:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"tap");
}

- (void)doubleTap:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"doubleTap");
}

- (void)swipe:(UISwipeGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe RIGHT");
    } else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe LEFT");
    }
}

- (void)pan:(UIPanGestureRecognizer *)gestureRecognizer
{
    NSLog(@"pan : %@", NSStringFromCGPoint([gestureRecognizer locationInView:self.view]));
}

- (void)longPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"long press - state: %d - default duration: %f", gestureRecognizer.state, gestureRecognizer.minimumPressDuration);
    }
}

- (void)rotation:(UIRotationGestureRecognizer *)gestureRecognizer
{
    double degree = gestureRecognizer.rotation / M_PI * 180;
    NSLog(@"%.3f : %.1f度", gestureRecognizer.rotation, degree);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
