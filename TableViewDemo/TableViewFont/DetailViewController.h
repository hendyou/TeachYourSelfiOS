//
//  DetailViewController.h
//  TableViewDemo
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
@private
    UITableView *_tableView;
    NSArray *_listArray;
}
@end
