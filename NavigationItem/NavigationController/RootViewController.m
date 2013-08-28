//
//  RootViewController.m
//  NavigationController
//
//  Created by Hendy on 13-8-28.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = view;
    [view release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(160 - 50, 30, 100, 40)];
    [button addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    //Navigation Left Item
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(showAlert)];
    //错误的写法!!!!!
//    self.navigationController.navigationItem.leftBarButtonItem = leftItem;
    //重要!!!UINavigationItem是由当前的UIViewController来控制的
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftItem release];
    
    //Navigation Right Item
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightBtn setTitle:@"right" forState:UIControlStateNormal];
    [rightBtn setFrame:CGRectMake(160 - 50, 30, 50, 30)];
//    [rightBtn sizeToFit];
    [rightBtn addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    
    //Navigation Title
    UIView *title = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    title.backgroundColor = [UIColor purpleColor];
    self.navigationItem.titleView = title;
    [title release];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)push:(id)sender
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    //Navigation has: {rootViewController, secondViewController}
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC release];
}

- (void)showAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    [alert release];
}

- (void) right
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"title" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"destructive" otherButtonTitles: nil];
    [sheet showInView:self.view];
    [sheet release];
}

@end
