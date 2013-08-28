//
//  MyView.m
//  UIViewDemo
//
//  Created by Hendy on 13-8-26.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    NSLog(@"tag : %d", self.tag);
    [super dealloc];
}

@end
