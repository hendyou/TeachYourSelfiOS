//
//  ModalViewController.h
//  ModalViewController
//
//  Created by Hendy on 13-8-27.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewControllerDelegate <NSObject>

@optional
- (void) textReturn:(NSString *)text;

@end

@interface ModalViewController : UIViewController
{
    @private
    UITextField *textField;
}

@property (nonatomic, assign) id<ModalViewControllerDelegate> delegate;

@end
