//
//  ViewController.m
//  HelloNoun
//
//  Created by Hendy Ou on 13-2-19.
//  Copyright (c) 2013年 Hendy Ou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//    // 此处做兼容处理需要加上ios6.0的宏开关，保证是在6.0下使用的,6.0以前屏蔽以下代码，否则会在下面使用self.view时自动加载viewDidLoad
//    if ([self.view window] == nil)// 是否是正在使用的视图
//    {
//        // Add code to preserve data stored in the views that might be
//        // needed later.
//        
//        // Add code to clean up other strong references to the view in
//        // the view hierarchy.
//        [self setUserInput: nil];
//        [self setUserOutput: nil];
//        
//        
//        self.view = nil;// 目的是再次进入时能够重新加载
//    }
    
}

- (IBAction)setOutput:(id)sender {
    self.userOutput.text = self.userInput.text;
}
@end
