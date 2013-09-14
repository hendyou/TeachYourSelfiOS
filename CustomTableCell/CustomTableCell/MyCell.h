//
//  MyCell.h
//  CustomTableCell
//
//  Created by Hendy on 13-9-2.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
{
    @private
    UILabel *_label;
}

@property (nonatomic, copy) NSString *data;

@end
