//
//  TouchView.m
//  TouchPinch
//
//  Created by Hendy on 13-9-3.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.multipleTouchEnabled = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count >= 2) {
        NSArray *touchArray = [touches allObjects];
        UITouch *firstTouch = touchArray[0];
        UITouch *secondTouch = touchArray[1];
        
        CGPoint point1 = [firstTouch locationInView:self];
        CGPoint point2 = [secondTouch locationInView:self];
        
        //计算两点距离: ((x1-x2)^2 + (y1-y2)^2)再开方
        _distance = [self distance:point1 point:point2];
        
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count >= 2) {
        NSArray *touchArray = [touches allObjects];
        UITouch *firstTouch = touchArray[0];
        UITouch *secondTouch = touchArray[1];
        
        CGPoint point1 = [firstTouch locationInView:self];
        CGPoint point2 = [secondTouch locationInView:self];
        
        //计算两点距离: ((x1-x2)^2 + (y1-y2)^2)再开方
        double distance2 = [self distance:point1 point:point2];
        double dValue = distance2 - _distance;
        if (dValue > 0) {
            //放大
            NSLog(@"图片放大");
        } else {
            //缩小
            NSLog(@"图片缩小");
        }
        
        _distance = distance2;
    }
}


//计算两点距离: ((x1-x2)^2 + (y1-y2)^2)再开方
- (double)distance:(CGPoint) point1 point:(CGPoint)point2
{
    return sqrt(pow(point1.x - point2.x, 2) + pow(point1.y - point2.y, 2));
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
