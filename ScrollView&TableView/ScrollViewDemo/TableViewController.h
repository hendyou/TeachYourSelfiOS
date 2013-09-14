//
//  TableViewController.h
//  ScrollView&TableView
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UIScrollViewDelegate>
{
    @private
    UIPageControl *pageControl;
}

@end
