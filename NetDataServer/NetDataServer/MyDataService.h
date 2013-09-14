//
//  MyDataService.h
//  NetDataServer
//
//  Created by Hendy on 13-9-7.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion) (id data);

@interface MyDataService : NSObject

+ (void)getWeatherData:(NSDictionary *)params block:(Completion)completion;

@end
