//
//  UIImageView+WebCach.m
//  ImagePicker
//
//  Created by Hendy on 13-9-6.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "UIImageView+WebCach.h"

@implementation UIImageView (WebCach)

- (void)setImageWithUrl:(NSURL *)url
{
    dispatch_queue_t queue = dispatch_queue_create("loadImage", NULL);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.image = image;
        });
    });
}

@end
