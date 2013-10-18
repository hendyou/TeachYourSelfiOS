//
//  ImageViewController.m
//  WiiBox
//
//  Created by Hendy Ou on 13-10-15.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ImageViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"

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
    _imageView.contentMode = UIViewContentModeCenter;
    _imageView.image = _startImage;
    
    [self downloadImage];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    tap.numberOfTapsRequired = 1;
    [_scrollView addGestureRecognizer:tap];
    
    _scrollView.minimumZoomScale = 1;
    _scrollView.maximumZoomScale = 3;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
}

- (void)dealloc {
    [_imageUrl release];
    [_startImage release];
    [_scrollView release];
    [_imageView release];
    [super dealloc];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Private methods
- (void)downloadImage
{
    if (!NSStringIsEmpty(_imageUrl)) {
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        NSURL *url = [NSURL URLWithString:_imageUrl];
        if (url)
        {
            [manager downloadWithURL:url delegate:self];
        }
    }
}

#pragma mark - 
- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = image;
}

#pragma mark - Actions
- (void)dismiss:(UITapGestureRecognizer *)gesture
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}
@end
