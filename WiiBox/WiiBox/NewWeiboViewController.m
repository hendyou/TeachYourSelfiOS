//
//  NewWeiboViewController.m
//  WiiBox
//
//  Created by Hendy Ou on 13-10-10.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "NewWeiboViewController.h"
#import "UIFactory.h"

@interface NewWeiboViewController ()

@end

@implementation NewWeiboViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"新微博";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initViews];
}

#pragma mark - UI
- (void)initViews
{
    //取消按钮
    UIButton *cancelBtn = [UIFactory createBarButtonItemWithFrame:CGRectMake(0, 0, 50, 30) title:@"取消" target:self action:@selector(cancel)];
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
    self.navigationItem.leftBarButtonItem = cancelItem;
    [cancelItem release];
    
    //发布按钮
    UIButton *sendBtn = [UIFactory createBarButtonItemWithFrame:CGRectMake(0, 0, 50, 30) title:@"发布" target:self action:@selector(send)];
    UIBarButtonItem *sendItem = [[UIBarButtonItem alloc] initWithCustomView:sendBtn];
    self.navigationItem.rightBarButtonItem = sendItem;
    [sendItem release];
    
    self.textView.text = @"新鲜事儿";
    
    self.textView.scrollEnabled = YES;
    
    self.textView.alwaysBounceVertical = YES;
    
    self.textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

#pragma mark - Actions
- (void)send
{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.textView resignFirstResponder];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    [_menuBar release];
    [_textView release];
    [super dealloc];
}

#pragma mark - UITextViewDelegate

@end
