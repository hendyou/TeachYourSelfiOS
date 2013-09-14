//
//  HomeViewController.m
//  WiiBox
//
//  Created by Hendy on 13-9-11.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"微博";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //绑定账号按钮
    UIBarButtonItem *bindItem = [[UIBarButtonItem alloc] initWithTitle:@"绑定账号" style:UIBarButtonItemStyleBordered target:self action:@selector(bindAction:)];
    self.navigationItem.rightBarButtonItem = bindItem;
    [bindItem release];
    
    //注销按钮
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleBordered target:self action:@selector(registerAction:)];
    self.navigationItem.leftBarButtonItem = registerItem;
    [registerItem release];
    
    if (self.sinaweibo.isAuthValid) {
        [self loadData];
    }
}

#pragma mark - load data
- (void)loadData
{
    NSString *url = @"statuses/home_timeline.json";
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"5" forKey:@"count"];
    [self.sinaweibo requestWithURL:url params:params httpMethod:@"GET" delegate:self];
}

#pragma mark - 
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"登陆失败");
}
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    
}

#pragma mark - actions
- (void)bindAction:(UIBarButtonItem *)barButton
{
    [self.sinaweibo logIn];
} 

- (void)registerAction:(UIBarButtonItem *)barButton
{
    [self.sinaweibo logOut];
}

@end
