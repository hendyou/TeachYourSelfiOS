//
//  MainViewController.m
//  Block
//
//  Created by Hendy on 13-9-4.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "MainViewController.h"
#import "BlockButton.h"

typedef int(^MyBlock) (int);

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
    
    /*
    //声明Block变量
    int(^myBlock)(int, NSString *, int);
    
    //创建block
    myBlock = ^(int a, NSString *str, int b) {
        NSLog(@"%d, %@, %d", a, str, b);
        return 10;
    };
    
    int res = myBlock(10, @"Hendy", 2);
    NSLog(@"result: %d", res);
    
    
    //通过typedf定义Block
    MyBlock myBlock2 = ^(int a) {
        NSLog(@"MyBlock : %d", a);
        return a;
    };
    
    myBlock2(2);
     */
    
    
    //-------Block作为参数----------
    /*
    MyBlock myBlock3 = ^(int a) {
        NSLog(@"Block作为参数 : %d", a);
        return a;
    };
    
    [self testBlock:myBlock3];
    */
    
    //-------Block引用局部变量----------
    /*
    int number = 2;//作为常量传到block中(相当于java中的final)
    __block int number2 = 20;//加__block关键字后此变量可以修改
    MyBlock myBlock4 = ^(int a) {
//        number = 4;//error
        NSLog(@"block中的number : %d", number);
        number2 = 30;
        return a + number;
    };
    NSLog(@"number 修改前: %d", number);
    number = 10;
    
//    NSLog(@"before: %d", number2);
    myBlock4(1);
//    NSLog(@"after: %d", number2);
    NSLog(@"number 修改后: %d", number);
     */
    
    
    //-------Block内存管理----------
    /*
    NSObject *obj = [[NSObject alloc] init];
    MyBlock myBlock5 = ^(int a) {
        NSLog(@"%d", obj.retainCount);
        return 2;
    };
    NSLog(@"%d", obj.retainCount);
    myBlock5(10);
     */
    
    
    
    BlockButton *button = [[BlockButton alloc] initWithFrame:CGRectMake(20, 50, 100, 30)];
    button.backgroundColor = [UIColor cyanColor];
    [button setTitle:@"Block" forState:UIControlStateNormal];
    button.block = ^(BlockButton *btn) {
        NSLog(@"%@", btn.titleLabel.text);
    };
    [self.view addSubview:button];
    
    
}

- (void)testBlock:(int(^)(int))myBlock
{
    NSLog(@"Block回调");
    myBlock(20);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
