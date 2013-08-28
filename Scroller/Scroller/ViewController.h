//
//  ViewController.h
//  Scroller
//
//  Created by Hendy on 13-3-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *theScroller;
@property (nonatomic) CGPoint scrollViewOffset;

@end
