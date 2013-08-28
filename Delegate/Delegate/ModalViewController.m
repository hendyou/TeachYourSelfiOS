//
//  ModalViewController.m
//  ModalViewController
//
//  Created by Hendy on 13-8-27.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

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
    NSLog(@"loadView");
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.backgroundColor = [UIColor magentaColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    button.frame = CGRectMake(160 - 50, 100, 100, 40);
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
	[view addSubview:button];
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(160 - 60, 180, 120, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [view addSubview:textField];
    
    self.view = view;
    
    [view release];
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

- (void)dealloc
{
    [textField release];
    [super dealloc];
}

- (void) dismiss
{
    //delegate mode
    [self.delegate textReturn:textField.text];
    
    //notification mode
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NoticeTextChange" object:textField.text];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0 ) {
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

@end
