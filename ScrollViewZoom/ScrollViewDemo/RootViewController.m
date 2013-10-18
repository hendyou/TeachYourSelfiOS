//
//  RootViewController.m
//  ScrollViewDemo
//
//  Created by Hendy on 13-9-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    NSLog(@"%@", NSStringFromCGRect(bounds));
    
    scrollView = [[UIScrollView alloc] initWithFrame:bounds];
    scrollView.autoresizingMask =
          UIViewAutoresizingFlexibleLeftMargin
        | UIViewAutoresizingFlexibleRightMargin
        | UIViewAutoresizingFlexibleTopMargin
        | UIViewAutoresizingFlexibleBottomMargin
        | UIViewAutoresizingFlexibleWidth
        | UIViewAutoresizingFlexibleHeight;
    
    //设置内容大小
//    scrollView.contentSize = CGSizeMake(320, 460);
    
    scrollView.minimumZoomScale = 1;
    scrollView.maximumZoomScale = 3;
    
//    scrollView.bouncesZoom = NO;
    
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    imageView = [[UIImageView alloc] initWithFrame:bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleBottomMargin
    | UIViewAutoresizingFlexibleWidth
    | UIViewAutoresizingFlexibleHeight;
    imageView.image = [UIImage imageNamed:@"sexy.jpg"];
    
    [scrollView addSubview:imageView];
    
}


#pragma mark - ScrollView delegate

#pragma mark - 缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2)
{
    NSLog(@"scrollViewDidZoom");
}// any zoom scale changes

 
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"viewForZoomingInScrollView");
    return imageView;
}// return a view that will be scaled. if delegate returns nil, nothing happens

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    NSLog(@"scrollViewWillBeginZooming");
}// called before the scroll view begins zooming its content

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    NSLog(@"scrollViewDidEndZooming");
}// scale between minimum and maximum. called after any 'bounce' animations

- (void)dealloc
{
    [scrollView release];
    [imageView release];
    [super dealloc];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
//    [UIView animateWithDuration:duration animations:^{
//        imageView.image = imageView.image;
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
