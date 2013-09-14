//
//  MainViewController.m
//  ImagePicker
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MainViewController.h"
#import "UIImageView+WebCach.h"
#import "MyImageView.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    _imageView = [[MyImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 350)];
    _imageView.backgroundColor = [UIColor cyanColor];
    _imageView.clipsToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(30, 390, 100, 40);
    [button setTitle:@"访问网络图片" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(getImageFromNet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    

}

- (void)getImageFromNet
{
    //加载网络图片
    NSURL *url = [NSURL URLWithString:@"http://h.hiphotos.baidu.com/album/w%3D2048/sign=979e129794cad1c8d0bbfb274b066609/5366d0160924ab1830fbe38f34fae6cd7a890b9c.jpg"];
    
    //多线程方式加载
//    [_imageView setImageWithUrl:url];
    [_imageView setImageFromUrl:url];
}

- (void)dealloc
{
    [_imageView release];
    [super dealloc];
}

@end
