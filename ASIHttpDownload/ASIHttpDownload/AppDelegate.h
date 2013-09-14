//
//  AppDelegate.h
//  ASIHttpDownload
//
//  Created by Hendy on 13-9-9.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Reachability;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,retain) Reachability *reachability;

@end
