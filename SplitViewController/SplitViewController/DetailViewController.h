//
//  DetailViewController.h
//  SplitViewController
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NaviViewController;

@interface DetailViewController : UIViewController
{
    UIPopoverController *_popover;
    NaviViewController *_naviCtrl;
}

@end
