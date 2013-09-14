//
//  MainViewController.h
//  ImagePicker
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyImageView;

@interface MainViewController : UIViewController <UINavigationControllerDelegate>
{
    @private
    MyImageView *_imageView;
}

@end
