//
//  RootViewController.m
//  ScrollViewDemo
//
//  Created by Hendy on 13-9-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "RootViewController.h"
#import "ImageScrollView.h"

#define PAGE_NUM 10
#define PAGE_WIDTH 340

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
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, PAGE_WIDTH, 460)];
    //设置内容大小
    _scrollView.contentSize = CGSizeMake(PAGE_WIDTH * PAGE_NUM, 460);
    
    _scrollView.backgroundColor = [UIColor blackColor];
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.tag = INTMAX_MAX;
    
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    
    [_scrollView release];
    
    for (int i = 0; i < PAGE_NUM; i++) {
        CGRect frame = _scrollView.bounds;
        frame.origin.x = i * frame.size.width;
        frame.size.width = 320;
        ImageScrollView *imageScrollView = [[ImageScrollView alloc] initWithFrame:frame];
        imageScrollView.tag = i;
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", 10 + i]];
        imageScrollView.imageView.image = image;
        [_scrollView addSubview:imageScrollView];
    }
    
}


#pragma mark - ScrollView delegate
int previousPage = 0;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int currentPage = scrollView.contentOffset.x / PAGE_WIDTH;
    ImageScrollView *lastImage = (ImageScrollView *)[scrollView viewWithTag:previousPage];
//    NSLog(@"lastImage zoomScale: %f", lastImage.zoomScale);
    if (currentPage != previousPage && lastImage.zoomScale > 1) {
        lastImage.zoomScale = 1;
    }
    previousPage = currentPage;
}

#pragma mark - 缩放
/*
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
*/

- (void)dealloc
{
    [_scrollView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
