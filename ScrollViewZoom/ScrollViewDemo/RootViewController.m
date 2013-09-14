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
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    //设置内容大小
    scrollView.contentSize = CGSizeMake(320, 460);
    
    scrollView.minimumZoomScale = 1;
    scrollView.maximumZoomScale = 3;
    
//    scrollView.bouncesZoom = NO;
    
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
