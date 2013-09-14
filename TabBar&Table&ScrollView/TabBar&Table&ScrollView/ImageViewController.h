//
//  ImageViewController.h
//  TabBar&Table&ScrollView
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController <UIScrollViewDelegate>
{
    @private
    UIScrollView *_scrollView;
    UIImageView *_imageView;
}

- (id)initWithImage:(UIImage *)image;

@end
