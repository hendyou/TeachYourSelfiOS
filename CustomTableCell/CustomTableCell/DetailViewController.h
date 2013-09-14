//
//  DetailViewController.h
//  CustomTableCell
//
//  Created by Hendy on 13-9-2.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController
{
    @private
    NSArray *listArray;
}

@property (nonatomic, assign) kTableViewCellType cellType;

@end
