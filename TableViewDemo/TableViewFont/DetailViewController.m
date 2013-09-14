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

int cellCount;

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initValues
{
    cellCount = 1;
    _lastSelected = [[NSIndexPath indexPathForRow:0 inSection:0] retain];
}

- (void)loadView
{
    [self initValues];
    
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = view;
    [view release];
    
    NSArray *array = [UIFont familyNames];
    _fontsArray = [[NSMutableArray alloc] initWithCapacity:13];
    NSMutableArray *temp = nil;
    for (int i = 0; i < array.count; i++) {
        NSString *font = array[i];
        if (i % 5 == 0) {
            temp = [[NSMutableArray alloc] initWithCapacity:5];
            [_fontsArray addObject:temp];
            [temp release];
        }
        [temp addObject:font];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWight, kDeviceHeight - self.navigationController.navigationBar.frame.size.height) style:self.isPlain ? UITableViewStylePlain : UITableViewStyleGrouped];
    //    NSLog(@"%f", kDeviceHeight);
    //    NSLog(@"%@", _tableView);
    //实现数据源方法
    [self.view addSubview:_tableView];
    
    //设置数据源
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
//    _tableView.rowHeight = 60;
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
    [_fontsArray release];
    [_lastSelected release];
    [super dealloc];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _fontsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_fontsArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    //检查是否有闲置的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        NSLog(@"new cell: %d", cellCount++);
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier    ] autorelease];
        if (self.isPlain) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    cell.textLabel.text = _fontsArray[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:_fontsArray[indexPath.section][indexPath.row] size:16];
    
    if (!self.isPlain) {
        if (_lastSelected.row == indexPath.row && _lastSelected.section == indexPath.section) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"第%d个section(header)", section];
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"第%d个section(footer)", section];
//
//}

#pragma mark - TableView delegate
//一开始已经已经计算好, 滑动的时候不再调用
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row Height******%@", indexPath);
    if (indexPath.row % 2 == 0) {
        return 30;
    } else {
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    NSLog(@"Header Height******%d", section);
//    if (section % 2 == 0) {
//        return 10;
//    } else {
//        return 30;
//    }
    return 25;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 40;
//}

//设置自定义section视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.isPlain) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        headerView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.7];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 290, 25)];
        label.backgroundColor = [UIColor clearColor];
//        [label sizeToFit];
        label.font = [UIFont systemFontOfSize:16];
        label.text = [NSString stringWithFormat:@"第%d个section(header)", section];
        label.textColor = [UIColor grayColor];
        [headerView addSubview:label];
        [label release];
        return [headerView autorelease];
        
    } else {
        return nil;
    }
}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
//    footerView.backgroundColor = [UIColor redColor];
//    return [footerView autorelease];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消高亮
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!self.isPlain) {
        //标记选择状态
        [_tableView cellForRowAtIndexPath:_lastSelected].accessoryType = UITableViewCellAccessoryNone;
        [_tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [indexPath retain];
        [_lastSelected release];
        _lastSelected = indexPath;        
    }
}

@end
