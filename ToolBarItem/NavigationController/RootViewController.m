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
    
    
    //ToolBar
//    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 460 - 44 - 44, 320, 44)];
//    toolBar.barStyle = UIBarStyleBlackTranslucent;
//    [self.view addSubview:toolBar];
//    [toolBar release];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:nil];
    
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithTitle:@"title" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回图标"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"返回图标"]];
    UIBarButtonItem *imageViewItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    
    //设置等宽间隔
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 5;
    
    NSArray *items = @[addItem, fixedItem, saveItem, flexibleItem, titleItem, flexibleItem, imageItem, flexibleItem, imageViewItem];
//    [toolBar setItems:items animated:YES];
    [addItem release];
    [saveItem release];
    [titleItem release];
    [imageItem release];
    [imageView release];
    [imageViewItem release];
    [flexibleItem release];
    [fixedItem release];
    
    [self.navigationController setToolbarHidden:NO animated:YES];
    //错误的添加方法
//    [self.navigationController setToolbarItems:items animated:YES];
    [self setToolbarItems:items animated:YES];
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
