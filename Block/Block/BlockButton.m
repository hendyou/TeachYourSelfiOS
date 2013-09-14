//
//  BlockButton.m
//  Block
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "BlockButton.h"

@implementation BlockButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)clickAction
{
    self.block(self);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
