//
//  TableViewController.h
//  TableViewEditing
//
//  Created by Hendy on 13-9-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController<UITextFieldDelegate>
{
    @private
    NSArray *_data;
}

@property (nonatomic, retain) NSArray *fontArray;

@end
