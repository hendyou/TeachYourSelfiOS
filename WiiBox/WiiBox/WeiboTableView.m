//
//  WeiboTableView.m
//  WiiBox
//
//  Created by Hendy on 13-9-18.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "WeiboTableView.h"
#import "WeiboModel.h"
#import "WeiboCell.h"
#import "WeiboView.h"
#import "DetailViewController.h"

@implementation WeiboTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        //监听通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:kReloadWeiboList object:nil];
    }
    return self;
}

#pragma mark - Table view source data

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentify";
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        [cell autorelease];
    }
    
    WeiboModel *weiboModel = self.data[indexPath.row];
    cell.weiboModel = weiboModel;
    
    return cell;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float height = [WeiboView weiboViewHeight:self.data[indexPath.row] isDetail:NO isRepost:NO];
    if ([self.data[indexPath.row] retweeted] != nil) {
        height += 90;
    } else {
        height += 75;
    }
    return height;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    DetailViewController *detail = [[DetailViewController alloc] init];
    [detail autorelease];
    detail.weiboModel = self.data[indexPath.row];
    [self.viewController.navigationController pushViewController:detail animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
