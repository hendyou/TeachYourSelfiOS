//
//  MoreViewController.h
//  WiiBox
//  更多 控制器
//
//  Created by Hendy on 13-9-11.
//  Copyright (c) 2013年 Hendy. All rights reserved.
//

#import "BaseViewController.h"

@interface MoreViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;


@end
