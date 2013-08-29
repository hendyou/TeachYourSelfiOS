//
//  TableViewController.m
//  TableViewFont
//
//  Created by Hendy on 13-8-29.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"




@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"UITableView style";
    }
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view = view;
    [view release];
    
//    self.listArray = [UIFont familyNames];
    self.listArray = @[@"UITableViewStyleGrouped", @"UITableViewStylePlain", @"...", @"****",];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWight, kDeviceHeight - self.navigationController.navigationBar.frame.size.height) style:UITableViewStylePlain];
//    NSLog(@"%f", kDeviceHeight);
//    NSLog(@"%@", _tableView);
    //实现数据源方法
    [self.view addSubview:_tableView];
    
    //设置数据源
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    _tableView.rowHeight = 60; //默认是44
    
//    _tableView.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_bg"]] autorelease];
    
    //分隔线
//    _tableView.separatorColor = [UIColor orangeColor];
    
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
    
    //表头视图
//    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    header.backgroundColor = [UIColor purpleColor];
//    _tableView.tableHeaderView = header;
//    [header release];
//    
//    UILabel *headerText = [[UILabel alloc] initWithFrame:CGRectMake(160 - 100, 7, 200, 30)];
//    headerText.textAlignment = NSTextAlignmentCenter;
//    headerText.text = @"I love you";
//    [header addSubview:headerText];
//    [headerText release];
    
    //表尾视图
//    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
//    footer.backgroundColor = [UIColor yellowColor];
//    _tableView.tableFooterView = footer;
//    [footer release];
    
//    _tableView.allowsSelection = NO;
}

- (void)dealloc
{
    [_tableView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationItem setBackBarButtonItem:[[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil] autorelease]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%@", indexPath);
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier    ] autorelease];
    }
    cell.textLabel.text = self.listArray[indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
    NSLog(@"didHighlightRowAtIndexPath %@", indexPath);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath %@", indexPath);
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}
@end
