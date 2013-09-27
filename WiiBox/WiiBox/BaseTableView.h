//
//  BaseTableView.h
//  WiiBox
//
//  Created by Hendy on 13-9-18.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@class BaseTableView;
@protocol UITableViewEventDelegate <NSObject>
@optional
- (void)pullDown:(BaseTableView *)tableView;
- (void)pullUp:(BaseTableView *)tableView;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface BaseTableView : UITableView<EGORefreshTableHeaderDelegate,UITableViewDataSource, UITableViewDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;
    UIActivityIndicatorView *_indicator;
    UIButton *_moreBtn;
    BOOL _reloading;
}

@property (retain, nonatomic) NSMutableArray *data;

//是否需要下拉效果
@property (assign, nonatomic) BOOL enableRefreshHeader;

@property (assign, nonatomic) id<UITableViewEventDelegate> eventDelegate;

@property (assign, nonatomic) BOOL isMore;

- (void)doneLoadingTableViewData;

- (void)refreshUpdateDate;

- (void)initLoading;

- (void)finishMoreLoading;

- (void)enableLoadingMore:(BOOL)enable;

@end
