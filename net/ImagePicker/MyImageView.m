//
//  MyImageView.m
//  net
//
//  Created by Hendy on 13-9-7.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _data = [[NSMutableData data] retain];
    }
    return self;
}

- (void)setImageFromUrl:(NSURL *)url
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
    
    //---------异步同步请求1(新方法 5.0 later)------------
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *respone, NSData *data, NSError *error) {
//        UIImage *image = [UIImage imageWithData:data];
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            
//            self.image = image;
//        });
//        
//    }];
//    [queue release];
    
    
    //---------异步同步请求2------------
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
//    [conn cancel];
    [request release];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
    NSLog(@"%d", _data.length);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Finish");
    UIImage *image = [UIImage imageWithData:_data];
    self.image = image;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error");
}

- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
{
    NSLog(@"Cancel");
}

- (void)dealloc
{
    [_data release];
    [super dealloc];
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
