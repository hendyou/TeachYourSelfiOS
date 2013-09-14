//
//  ImageScrollView.h
//  ScrollViewAlbum
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollView : UIScrollView <UIScrollViewDelegate>
{
    
}

@property (nonatomic, readonly, retain) UIImageView *imageView;
@end
