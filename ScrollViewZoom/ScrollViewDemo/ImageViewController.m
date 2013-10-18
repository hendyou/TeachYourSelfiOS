//
//  ImageViewController.m
//  ScrollViewZoom
//
//  Created by Hendy Ou on 13-10-16.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

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
    // Do any additional setup after loading the view from its nib.
    
    //设置内容大小
//    self.scrollView.contentSize = CGSizeMake(320, 460);
    
    
    //    scrollView.bouncesZoom = NO;
    
    self.scrollView.delegate = self;
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.imageView.contentMode = UIViewContentModeCenter;
    UIImage *image = [UIImage imageNamed:@"sexy.jpg"];
    CGRect rect = CGRectZero;
    rect.size = image.size;
    self.imageView.frame = rect;
    self.imageView.image = image;
    
    self.scrollView.contentSize = rect.size;
    float scaleX = self.scrollView.bounds.size.width / rect.size.width;
    float scaleY = self.scrollView.bounds.size.height / rect.size.height;
    float scale = MIN(scaleX, scaleY);
    
    if (scaleX > 1.0 && scaleY > 1.0) {
        scale = 1.0;
    }
    
    
    self.scrollView.minimumZoomScale = scale;
    self.scrollView.maximumZoomScale = scale * 3;
    self.scrollView.zoomScale = scale;
    
//    [self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_scrollView release];
    [_imageView release];
    [super dealloc];
}

#pragma mark - ScrollView delegate

#pragma mark - 缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2)
{
//    NSLog(@"scrollViewDidZoom");
}// any zoom scale changes


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"viewForZoomingInScrollView");
    return self.imageView;
}// return a view that will be scaled. if delegate returns nil, nothing happens

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
//    NSLog(@"scrollViewWillBeginZooming");
}// called before the scroll view begins zooming its content

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
//    NSLog(@"scrollViewDidEndZooming");
}// scale between minimum and maximum. called after any 'bounce' animations
@end
