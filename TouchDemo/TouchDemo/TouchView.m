//
//  TouchView.m
//  TouchDemo
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
        self.userInteractionEnabled = YES;//The default value of this property is YES.
        self.multipleTouchEnabled = YES;//The default value of this property is NO.
        
        _moveView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _moveView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_moveView];
    }
    return self;
}

- (void)dealloc
{
    [_moveView release];
    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan: %d", touches.count);
    NSUInteger tapCount = [[touches anyObject] tapCount];
    
    if (tapCount == 1) {
        [self performSelector:@selector(singleTap:) withObject:touches afterDelay:0.3];
    } else if (tapCount == 2) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleTap:) object:nil];
        [self doubleTap:touches];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved: %d", touches.count);
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
//    CGRect frame = _moveView.frame;
//    frame.origin = point;
//    _moveView.frame = frame;
    
    _moveView.center = point;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded: %d", touches.count);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled: %d", touches.count);
}

- (void)singleTap:(NSSet *)touches
{
    NSLog(@"tap count: 1");
    CGPoint point = [[touches anyObject] locationInView:self];
    NSLog(@"singleTouch location: %@", NSStringFromCGPoint(point));
}

- (void)doubleTap:(NSSet *)touches
{
    NSLog(@"tap count: 2");
}

@end
