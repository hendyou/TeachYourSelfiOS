//
//  MyRequest.m
//  NetDataServer
//
//  Created by Hendy on 13-9-7.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MyRequest.h"

@implementation MyRequest

- (void)startAsync:(FinishBlock)finish
{
    self.data = [NSMutableData data];
    self.connection =  [NSURLConnection connectionWithRequest:self delegate:self];
    self.finish = finish;
}

- (void)cancel
{
    [self.connection cancel];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%@", [NSThread isMainThread] ? @"Main Thread" : @"Multi Thread");
    self.finish(self.data);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

- (void)dealloc
{
    self.connection = nil;
    self.data = nil;
    [super dealloc];
}

@end
