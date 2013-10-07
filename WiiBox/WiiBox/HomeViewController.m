//
//  HomeViewController.m
//  WiiBox
//
//  Created by Hendy on 13-9-11.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "HomeViewController.h"
#import "WeiboModel.h"
#import "WeiboTableView.h"
#import "UIFactory.h"
#import "AttentionUtil.h"
#import "MainViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

#define kLoadCount 20

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"微博";
    }
    return self;
}

- (void)dealloc {
    [_tableView release];
    [_weiboCountView release];
    [_countLabel release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //绑定账号按钮
    UIBarButtonItem *bindItem = [[UIBarButtonItem alloc] initWithTitle:@"绑定账号" style:UIBarButtonItemStyleBordered target:self action:@selector(bindAction:)];
    self.navigationItem.rightBarButtonItem = bindItem;
    [bindItem release];
    
    //注销按钮
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleBordered target:self action:@selector(registerAction:)];
    self.navigationItem.leftBarButtonItem = registerItem;
    [registerItem release];
    
    //Table view
    _tableView = [[WeiboTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.eventDelegate = self;
    _tableView.enableRefreshHeader = YES;
    
    if (self.sinaweibo.isAuthValid) {
        [self loadData];
    } else {
        [self.sinaweibo logIn];
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _tableView.frame = self.view.bounds;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //开启左滑右滑
    [self.appDelegate.menu setEnableGesture:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //禁用左滑右滑
    [self.appDelegate.menu setEnableGesture:NO];
}

#pragma mark - Public methods
- (void)initLoading
{
    [_tableView initLoading];
    [self pullDownData];
}

#pragma mark - UI
//显示更新了多少条微博
- (void)showWeiboCount:(int)count
{
    if (_weiboCountView == nil) {
        //微博更新数量提示View
        _weiboCountView = [UIFactory createImageView:@"timeline_new_status_background.png"];
        _weiboCountView.frame = CGRectMake(0, -34, ScreenWidth, 34);
        _weiboCountView.insets = UIEdgeInsetsMake(5, 5, 5, 5);
        //提示的内容
        _countLabel = [[UILabel alloc] initWithFrame:_weiboCountView.bounds];
        _countLabel.font = [UIFont systemFontOfSize:16];
        _countLabel.backgroundColor = [UIColor clearColor];
        _countLabel.textColor = [UIColor whiteColor];
        _countLabel.textAlignment = NSTextAlignmentCenter;
        [_weiboCountView addSubview:_countLabel];
        [self.view addSubview:_weiboCountView];
    }
    
    //显示更新了多少条微博
    //    NSLog(@"更新了%d", updateCount);
    _countLabel.text = [NSString stringWithFormat:@"更新了%d条微博", count];
    [UIView animateWithDuration:0.5 animations:^{
        _weiboCountView.top = 2;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _weiboCountView.top = -_weiboCountView.height;
        } completion:nil];
    }];
    
    if (count > 0) {        
        //播放提示音
        [AttentionUtil playSystemSound:@"msgcome.wav"];
    }
}

#pragma mark - load data
- (void)loadData
{
    NSString *url = @"statuses/home_timeline.json";
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:[NSString stringWithFormat:@"%d", kLoadCount]  forKey:@"count"];
    [self.sinaweibo requestWithURL:url params:params httpMethod:@"GET" delegate:self];
    
    //显示loading提示
    MainViewController *main = (MainViewController *)self.tabBarController;
    [main showIndicator:@"正在读取数据..."];
    _tableView.hidden = YES;
}

- (void) pullDownData
{
    if (self.topId == nil) {
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   [NSString stringWithFormat:@"%d", kLoadCount], @"count",
                                   self.topId, @"since_id",
                                   nil];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json"
                            params:params
                        httpMethod:@"GET"
                          finished:^(id result) {
                              [self pullDownDataFinished:result];
                          }];
}

- (void) pullDownDataFinished:(id) result
{
    NSArray *statues = [result objectForKey:@"statuses"];
    NSMutableArray *weibos = [NSMutableArray arrayWithCapacity:statues.count];
    for (NSDictionary *statuesDic in statues) {
        WeiboModel *weibo = [[WeiboModel alloc] initWithDataDic:statuesDic];
        [weibos addObject:weibo];
        [weibo release];
    }
    
    int updateCount = weibos.count;
    if (weibos.count > 0) {
        [weibos addObjectsFromArray:_tableView.data];
        
        _tableView.data = weibos;
        
        self.topId = [[weibos[0] id] stringValue];
        
        [_tableView reloadData];
    }
    //隐藏下拉视图
    [_tableView doneLoadingTableViewData];
    
    [self showWeiboCount:updateCount];
    
    //更新下拉视图的最后更新日期
    [_tableView refreshUpdateDate];
    
    //隐藏TabBar里的未读微博数
    [(MainViewController *)self.tabBarController hideUnreadBadge];
    
}

- (void) pullUpData
{
    if (self.lastId == nil) {
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   [NSString stringWithFormat:@"%d", kLoadCount+1], @"count",
                                   self.lastId, @"max_id",
                                   nil];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json"
                            params:params
                        httpMethod:@"GET"
                          finished:^(id result) {
                              [self pullUpDataFinished:result];
                          }];
}

- (void) pullUpDataFinished:(id) result
{
    NSArray *statues = [result objectForKey:@"statuses"];
    NSMutableArray *weibos = [NSMutableArray arrayWithCapacity:statues.count];
    for (NSDictionary *statuesDic in statues) {
        WeiboModel *weibo = [[WeiboModel alloc] initWithDataDic:statuesDic];
        [weibos addObject:weibo];
        [weibo release];
    }
    
    //返回ID小于或等于max_id的微博, 包括max_id的微博, 要移除
    if (weibos.count > 0) {
        [weibos removeObjectAtIndex:0];
    }

    if (weibos.count > 0) {
        
        [_tableView.data addObjectsFromArray:weibos];
        
        self.lastId = [[weibos.lastObject id] stringValue];
        
        [_tableView reloadData];
    }
    //标记数据加载完成
    [_tableView finishMoreLoading];
    
    if (weibos.count < kLoadCount) {
        _tableView.isMore = NO;
    }
}

#pragma mark - SinaWeiboRequestDelegate
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"登陆失败");
}
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    NSArray *statuses = result[@"statuses"];
    NSMutableArray *weiboArray = [NSMutableArray arrayWithCapacity:statuses.count];
    for (NSDictionary *weiboDic in statuses) {
        WeiboModel *weibo = [[WeiboModel alloc] initWithDataDic:weiboDic];
        [weiboArray addObject:weibo];
        [weibo release];
    }
    
    if (weiboArray.count > 0) {
        self.topId = [[weiboArray[0] id] stringValue];
        self.lastId = [[weiboArray.lastObject id] stringValue];
    }
    
    _tableView.data = weiboArray;
    
    //更新下拉视图的最后更新日期
    [_tableView refreshUpdateDate];
    
    [_tableView reloadData];
    
    //关闭loading提示
    MainViewController *main = (MainViewController *)self.tabBarController;
    [main hideIndicator:0];
    _tableView.hidden = NO;
}

#pragma mark - BaseTableView event delegate
- (void)pullDown:(BaseTableView *)tableView
{
//    NSLog(@"----------请求网络数据");
//    [_tableView performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
    
    [self pullDownData];
}

- (void)pullUp:(BaseTableView *)tableView
{
    [self pullUpData];
}

#pragma mark - actions
- (void)bindAction:(UIBarButtonItem *)barButton
{
    [self.sinaweibo logIn];
} 

- (void)registerAction:(UIBarButtonItem *)barButton
{
    [self.sinaweibo logOut];
}


@end
