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
    //---------多线程------------
//    dispatch_queue_t queue = dispatch_queue_create("loadImage", NULL);
//    dispatch_async(queue, ^{
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:data];
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            self.image = image;
//        });
//    });

    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:30];
    //---------使用同步请求------------
    
//    NSURLResponse *response;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];    
//    UIImage *image = [UIImage imageWithData:data];
//    self.image = image;
    
    //---------异步同步请求------------
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *respone, NSData *data, NSError *error) {
        UIImage *image = [UIImage imageWithData:data];
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            self.image = image;
        });
        
    }];
    [queue release];
    
    
    [request release];
}

@end
