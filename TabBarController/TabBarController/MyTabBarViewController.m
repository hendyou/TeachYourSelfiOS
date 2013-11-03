//
//  MyTabBarViewController.m
//  TabBarController
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MyTabBarViewController.h"

@interface MyTabBarViewController ()

@end

@implementation MyTabBarViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.selectedIndex = 2;
//    self.tabBar.selectedImageTintColor = [UIColor redColor];
    self.tabBar.tintColor = [UIColor greenColor];
    
    self.tabBar.barStyle = UIBarStyleBlack;
    
    UIImage *image = [UIImage imageNamed:@"tabbar_slider.png"];
    self.tabBar.selectionIndicatorImage = image;
    
//    UIView *view = [[UIView alloc] initWithFrame:self.tabBar.bounds];
//    view.backgroundColor = [UIColor redColor];
//    
//    [self.tabBar addSubview:view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
