//
//  MainViewController.h
//  ImagePicker
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    @private
    UIImageView *_imageView;
}

@end
