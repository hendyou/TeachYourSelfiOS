//
//  ImageViewController.m
//  TabBar&Table&ScrollView
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.hidesBottomBarWhenPushed = YES;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _scrollView.maximumZoomScale = 3;
        _scrollView.minimumZoomScale = 1;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        
        _imageView = [[UIImageView alloc] initWithFrame:_scrollView.bounds];
        _imageView.backgroundColor = [UIColor blackColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = image;
        [_scrollView addSubview:_imageView];
        
        UITapGestureRecognizer *doubleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        doubleGesture.numberOfTapsRequired = 2;
        [_scrollView addGestureRecognizer:doubleGesture];
        [doubleGesture release];
        
        [self.view addSubview:_scrollView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect frame = self.view.bounds;
    _scrollView.frame = frame;
    _imageView.frame = frame;
    
//    int imgWidth = _imageView.image.size.width;
//    int imgHeight = _imageView.image.size.height;
//    float scaleWidth = imgWidth / frame.size.width;
//    float scaleHeight = imgHeight / frame.size.height;
//    if (scaleWidth > scaleHeight) {
//        //适应宽度
//        frame.size.height = imgHeight / scaleWidth;
//        frame.origin.y = (self.view.bounds.size.height - frame.size.height) / 2;
//    } else {
//        //适应高度
//        frame.size.width = imgWidth / scaleHeight;
//        frame.origin.x = (self.view.bounds.size.width - frame.size.width) / 2;
//    }
//    _imageView.frame = frame;
}

- (void)dealloc
{
    [_scrollView release];
    [_imageView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doubleTap:(UITapGestureRecognizer *)gesture
{
    if (_scrollView.zoomScale > 1) {
        //缩小
        [_scrollView setZoomScale:1 animated:YES];
    } else {
        //放大
        CGPoint point = [gesture locationInView:_scrollView];
        [_scrollView zoomToRect:CGRectMake(point.x - 20, point.y - 20, 40, 40) animated:YES];
    }
}

#pragma mark - Scroll view delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

@end
