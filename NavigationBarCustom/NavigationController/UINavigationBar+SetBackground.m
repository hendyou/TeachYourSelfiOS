//
//  UINavigationBar+SetBackground.m
//  NavigationBarCustom
//
//  Created by Hendy on 13-8-28.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "UINavigationBar+SetBackground.h"

@implementation UINavigationBar (SetBackground)

- (void)drawRect:(CGRect)rect
{
    NSLog(@"%@", NSStringFromCGRect(rect));
    UIImage *image = [UIImage imageNamed:@"tableCell_bottom.png"];
    [image drawInRect:rect];
} //5.0之前

@end
