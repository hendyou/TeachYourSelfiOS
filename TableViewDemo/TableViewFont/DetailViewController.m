//
//  DetailViewController.m
//  TableViewDemo
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    
    NSArray *array = [UIFont familyNames];
    
    NSMutableArray *temp = nil;
    for (int i = 0; i < array.count; i++) {
        if (i % 5 == 0) {
            temp = [[NSMutableArray alloc] initWithCapacity:5];
            [temp addObject:array[i]];
        }
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWight, kDeviceHeight - self.navigationController.navigationBar.frame.size.height) style:UITableViewStylePlain];
    //    NSLog(@"%f", kDeviceHeight);
    //    NSLog(@"%@", _tableView);
    //实现数据源方法
    [self.view addSubview:_tableView];
    
    //设置数据源
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
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
    [_tableView release];
    [_listArray release];
    [super dealloc];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier    ] autorelease];
    }
    cell.textLabel.text = _listArray[indexPath.row];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

@end
