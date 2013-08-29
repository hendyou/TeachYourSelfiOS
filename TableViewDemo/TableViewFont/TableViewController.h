//
//  TableViewController.h
//  TableViewFont
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    @private
    UITableView *_tableView;
}

@property (nonatomic, retain) NSArray *listArray;

@end
