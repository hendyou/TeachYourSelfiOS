//
//  MyRequest.h
//  NetDataServer
//
//  Created by Hendy on 13-9-7.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishBlock) (NSData *data);

@interface MyRequest : NSMutableURLRequest <NSURLConnectionDataDelegate>

@property (nonatomic, retain) NSMutableData *data;
@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, copy) FinishBlock finish;

- (void)startAsync:(FinishBlock)finish;

- (void)cancel;

@end
