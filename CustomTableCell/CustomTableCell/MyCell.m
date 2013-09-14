//
//  MyCell.m
//  CustomTableCell
//
//  Created by Hendy on 13-9-2.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MyCell.h"

@interface MyCell ()

-(void)initSubViews;

@end

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initSubViews];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initSubViews
{
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.tag = 301;
    _label.font = [UIFont boldSystemFontOfSize:17];
    [self.contentView addSubview:_label];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //要在这里写才能改变
    _label.frame = CGRectMake(40, 0, 280, 80);
    _label.text = self.data;
}

- (void)dealloc
{
    [_label release];
    [super dealloc];
}

@end
