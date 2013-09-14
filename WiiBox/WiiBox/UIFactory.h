//
//  UIFactory.h
//  WiiBox
//
//  Created by Hendy on 13-9-13.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeButton.h"

@interface UIFactory : NSObject

+ (ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString*)highlightedName;

+ (ThemeButton *)createButton:(NSString *)background highlightedBackground:(NSString *)highlightedBackground;

@end
