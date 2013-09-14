//
//  HeadCellScrollView.m
//  TabBar&Table&ScrollView
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "HeadCellScrollView.h"

@implementation HeadCellScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height - 15, frame.size.width, 10)];
        _pageControl.enabled = NO;
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.35];
        [self addSubview:_pageControl];
    }
    return self;
}

- (void)dealloc
{
    [_images release];
    [_pageControl release];
    [_scrollView release];
    [super dealloc];
}

- (void) setImages:(NSArray *)images
{
    int count = images.count;
    
    _images = [images retain];
    
    _pageControl.numberOfPages = count;
    
    _scrollView.contentSize = CGSizeMake(self.frame.size.width * count, self.frame.size.height);
    [self clearScrollView];
    for (int i = 0; i < count; i++) {
        CGRect frame = self.bounds;
        frame.origin.x = i * frame.size.width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = images[i];
        [_scrollView addSubview:imageView];
        [imageView release];
    }
}

- (UIImage *) currentImage
{
    return _images[_pageControl.currentPage];
}

- (void)clearScrollView
{
    for (UIView *view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - Scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
    _pageControl.currentPage = index;
}

@end
