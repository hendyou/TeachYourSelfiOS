//
//  MainViewController.h
//  UIViewAnimation
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIView *myView;
@property (retain, nonatomic) IBOutlet UIView *parentView;

- (IBAction)startAnim:(UIButton *)sender;
- (IBAction)transitionAction:(UIButton *)sender;
@end
