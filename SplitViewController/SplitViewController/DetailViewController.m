//
//  DetailViewController.m
//  SplitViewController
//
//  Created by Hendy on 13-9-5.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "DetailViewController.h"
#import "PopViewController.h"
#import "NaviViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Detail ViewController";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    
    //-----------浮动窗口---------------
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"pop窗口" style:UIBarButtonItemStyleBordered target:self action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftItem release];
    
    PopViewController *popViewController = [[PopViewController alloc] init];
    UINavigationController *naviCtrler = [[UINavigationController alloc] initWithRootViewController:popViewController];
    _popover = [[UIPopoverController alloc] initWithContentViewController:naviCtrler];
    _popover.popoverContentSize = CGSizeMake(300, 600);
    //传一个UIView的NSArray, 可以捕获这些view的事件, 且popover不会隐藏
//    _popover.passthroughViews = @[self.view];
    
    [popViewController release];
    [naviCtrler release];
    
    
    
    //-----------iPad上的模态类型---------------
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"modal窗口" style:UIBarButtonItemStyleBordered target:self action:@selector(modalAction:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    UIViewController *modalViewCtrl = [[UIViewController alloc] init];
    modalViewCtrl.title = @"Modal窗口";
    modalViewCtrl.view.backgroundColor = [UIColor grayColor];
    _naviCtrl = [[NaviViewController alloc] initWithRootViewController:modalViewCtrl];
    _naviCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
    [modalViewCtrl release];
    _naviCtrl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

}

- (void)modalTap:(UITapGestureRecognizer *)sender
{
    NSLog(@"________");
}

- (void)leftAction:(UIBarButtonItem *)barBtn
{
    if (_popover.isPopoverVisible) {
        [_popover dismissPopoverAnimated:YES];
    } else {
        [_popover presentPopoverFromBarButtonItem:barBtn permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//        [_popover presentPopoverFromRect:CGRectMake(400, 200, 100, 100) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    
}

- (void)modalAction:(UIBarButtonItem *)barBtn
{
    [self presentViewController:_naviCtrl animated:YES completion:nil];
}

- (void)dealloc
{
    [_popover release];
    [_naviCtrl release];
    [super dealloc];
}

@end
