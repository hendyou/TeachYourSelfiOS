//
//  ThirdViewController.m
//  NavigationController
//
//  Created by Hendy on 13-8-28.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"third: %p", self);
    indexVC = self.navigationController.viewControllers.count - 1;
    self.title = [NSString stringWithFormat:@"%d viewController", indexVC];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [backItem release];
    NSLog(@"count %d", self.navigationController.viewControllers.count);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = view;
    [view release];
    
    UIButton *rootBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rootBtn setTitle:@"root" forState:UIControlStateNormal];
    [rootBtn setFrame:CGRectMake(160 - 70, 30, 140, 40)];
    [rootBtn addTarget:self action:@selector(root:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:rootBtn];
    
    UIButton *popBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [popBtn setTitle:@"pop" forState:UIControlStateNormal];
    [popBtn setFrame:CGRectMake(160 - 70, 100, 140, 40)];
    [popBtn addTarget:self action:@selector(pop:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:popBtn];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn setFrame:CGRectMake(160 - 70, 170, 140, 40)];
    [pushBtn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:pushBtn];
    
    UIButton *indexBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [indexBtn setTitle:@"index" forState:UIControlStateNormal];
    [indexBtn setFrame:CGRectMake(160 - 70, 230, 140, 40)];
    [indexBtn addTarget:self action:@selector(index:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:indexBtn];
}

- (void)push:(id)sender
{
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
    [thirdVC release];
}
- (void)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)root:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)index:(id)sender
{
    UIViewController *secondVC = [[self.navigationController viewControllers] objectAtIndex:1];
    [self.navigationController popToViewController:secondVC animated:YES];
}

- (void)dealloc
{
    NSLog(@"%d dead", indexVC);
    [super dealloc];
}

@end
