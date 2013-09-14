//
//  HeadCellScrollView.h
//  TabBar&Table&ScrollView
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadCellScrollView : UIView <UIScrollViewDelegate>
{
    @private
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    NSArray *_images;
}

- (void) setImages:(NSArray *)images;

- (UIImage *) currentImage;

@end
