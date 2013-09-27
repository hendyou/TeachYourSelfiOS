//
//  UIFactory.m
//  WiiBox
//
//  Created by Hendy on 13-9-13.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "UIFactory.h"


@implementation UIFactory

+ (ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString*)highlightedName
{
    ThemeButton *button = [[ThemeButton alloc] initWithImage:imageName highlightedImage:highlightedName];
    return [button autorelease];
}

+ (ThemeButton *)createButton:(NSString *)background highlightedBackground:(NSString *)highlightedBackground
{
    ThemeButton *button = [[ThemeButton alloc] initwithBackground:background highlightedBackground:highlightedBackground];
    return [button autorelease];
}

+ (ThemeImageView *)createImageView:(NSString *)imageName
{
    ThemeImageView *imageView = [[ThemeImageView alloc] initWithImageName:imageName];
    return [imageView autorelease];
}

+ (ThemeLabel *)createLabel:(NSString *)fontColorName
{
    ThemeLabel *label = [[ThemeLabel alloc] initWithFontColor:fontColorName];
    return [label autorelease];
}

@end
