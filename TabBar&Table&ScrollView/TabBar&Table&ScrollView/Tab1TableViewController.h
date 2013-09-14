//
//  Tab1TableViewController.h
//  TabBar&Table&ScrollView
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeadCellScrollView;

@interface Tab1TableViewController : UITableViewController
{
    @private
    HeadCellScrollView *_headCell;
    NSMutableArray *_imageArray;
}

@end
