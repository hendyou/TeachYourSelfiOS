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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillHideNotification object:nil];
    
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
    
    self.textView.alwaysBounceVertical = YES;
    
    self.textView.scrollsToTop = NO;
    
    self.textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.textView becomeFirstResponder];
}

- (void)dealloc {
    [_menuBar release];
    [_textView release];
    [super dealloc];
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

- (void)keyboardAction:(NSNotification *)notification
{
    NSValue *frameValue = notification.userInfo[@"UIKeyboardFrameEndUserInfoKey"];
    CGRect frame = [frameValue CGRectValue];
    
    NSNumber *animDurationNumber = notification.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"];
    float animDuration = [animDurationNumber floatValue];
    
    NSString *notificationName = notification.name;
    if ([notificationName isEqualToString:UIKeyboardWillShowNotification]) {
        [UIView animateWithDuration:animDuration animations:^{
            self.menuBar.bottom = self.view.height - frame.size.height;
            self.textView.height = self.menuBar.top;
        }];
    } else if ([notificationName isEqualToString:UIKeyboardWillHideNotification]) {
        [UIView animateWithDuration:animDuration animations:^{
            self.menuBar.bottom = self.view.height;
            self.textView.height = self.menuBar.top;
        }];
    }
}

#pragma mark - UITextViewDelegate
@end
