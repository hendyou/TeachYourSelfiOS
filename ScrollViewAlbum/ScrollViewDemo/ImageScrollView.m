//
//  ImageScrollView.m
//  ScrollViewAlbum
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.maximumZoomScale = 3;
        self.minimumZoomScale = 1;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        self.delegate = self;
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoom:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
        [doubleTap release];
    }
    return self;
}

- (void)dealloc
{
    [_imageView release];
    [super dealloc];
}

- (void)zoom:(UITapGestureRecognizer *)recognizer
{
    if (self.zoomScale > 1) {
        //缩小
        [self setZoomScale:1 animated:YES];
    } else {
        //放大
        CGPoint point = [recognizer locationInView:self];
        [self zoomToRect:CGRectMake(point.x - 20, point.y - 20, 40, 40) animated:YES];
    }
}

#pragma mark - Scroll view delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
//    NSLog(@"lastImage zoomScale: %f", self.zoomScale);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
