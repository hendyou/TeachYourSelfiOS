//
//  MyDataService.m
//  NetDataServer
//
//  Created by Hendy on 13-9-7.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MyDataService.h"
#import "MyRequest.h"

#define BASE_URL @"http://www.weather.com.cn/data/sk/"

@implementation MyDataService

//访问天气预报接口数据
//http://www.weather.com.cn/data/sk/101010300.html
+ (void)getWeatherData:(NSDictionary *)params block:(Completion)completion
{
    NSString *cityCode = params[@"cityCode"];
    NSString *url = [NSString stringWithFormat:@"%@%@.html", BASE_URL, cityCode];
    
    [self getDataViaGet:url isPost:NO block:completion];
    
}

+ (void) getDataViaGet:(NSString *)url isPost:(BOOL)isPost block:(Completion)completion
{
    MyRequest *request = [MyRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:isPost ? @"POST" : @"GET"];
    [request setTimeoutInterval:60];
    
    [request startAsync:^(NSData *data) {
        NSString *dataStr = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
        NSLog(@"response data: %@", dataStr);
        
        id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        completion(res);
    }];
}

@end
