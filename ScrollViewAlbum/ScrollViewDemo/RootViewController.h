//
//  RootViewController.h
//  ScrollViewDemo
//
//  Created by Hendy on 13-9-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIScrollViewDelegate>
{
    @private
    UIScrollView *_scrollView;
}

@end
