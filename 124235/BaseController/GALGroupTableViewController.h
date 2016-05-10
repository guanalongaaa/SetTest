//
//  GALGroupTableViewController.h
//  124235
//
//  Created by guanalong on 16/4/27.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "GBaseViewController.h"

@interface GALGroupTableViewController : GBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain) UITableView *tableView; //列表
@property (nonatomic, retain) NSMutableArray *contentArray; //内容数组

-(UIView *)getTableHeaderView;
-(UIView *)getTableFooterView;

@end
