//
//  RootViewController.h
//  ModalViewController
//
//  Created by Hendy on 13-8-27.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@interface RootViewController : UIViewController <ModalViewControllerDelegate>
{
    @private
    UILabel *label;
}

@end
