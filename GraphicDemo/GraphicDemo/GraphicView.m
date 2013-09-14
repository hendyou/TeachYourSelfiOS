//
//  GraphicView.m
//  GraphicDemo
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "GraphicView.h"

@implementation GraphicView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    [[UIColor cyanColor] setFill];
    
    CGContextSetLineWidth(ctx, 5);
    
    CGContextMoveToPoint(ctx, 0, 0);
    
    //画线
    CGContextAddLineToPoint(ctx, 200, 0);

    CGContextDrawPath(ctx, kCGPathStroke);
    
    //画矩形
    CGContextAddRect(ctx, CGRectMake(0, 20, 200, 150));
    
    CGContextDrawPath(ctx, kCGPathFill);
}


@end
