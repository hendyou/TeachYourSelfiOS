//
//  BlockButton.h
//  Block
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlockButton;

typedef void(^TouchBlock)(BlockButton *);

@interface BlockButton : UIButton

@property (nonatomic, copy) TouchBlock block;

@end
