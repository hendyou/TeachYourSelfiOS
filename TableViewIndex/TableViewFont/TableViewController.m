//
//  TableViewController.m
//  TableViewFont
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

NSInteger intSort(id num1, id num2, void *context)
{
    NSString *v1 = num1 ;
    NSString *v2 = num2 ;
    return [v1 compare:v2];
}

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

    NSString *path = [[NSBundle mainBundle] pathForResource:@"ListData" ofType:@"plist"];
    _dataDic = [[NSDictionary dictionaryWithContentsOfFile:path] retain];
//    _keyArray = [[[_dataDic allKeys] sortedArrayUsingFunction:intSort context:NULL] retain];
    _keyArray = [[[_dataDic allKeys] sortedArrayUsingSelector:@selector(compare:)] retain];
    
    _tableView = [[UITableView alloc] initWithFrame:view.bounds style:UITableViewStylePlain];
    //实现数据源方法
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    
//    _tableView.allowsSelection = NO;
}

- (void)dealloc
{
    [_tableView release];
    [_keyArray release];
    [_dataDic release];
    [super dealloc];
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

#pragma mark - tableview data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSArray *)[_dataDic objectForKey:_keyArray[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier    ] autorelease];
    }
    NSString *item = [(NSArray *)[_dataDic objectForKey:_keyArray[indexPath.section]] objectAtIndex:indexPath.row];
    cell.textLabel.text = item;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keyArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _keyArray[section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keyArray;
}

@end
