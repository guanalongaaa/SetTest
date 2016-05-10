//
//  GALGroupTableViewController.m
//  124235
//
//  Created by guanalong on 16/4/27.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "GALGroupTableViewController.h"

@interface GALGroupTableViewController ()

@end

@implementation GALGroupTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    //自动调整
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //间隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //设置头脚
    self.tableView.tableFooterView = [self getTableFooterView];
    self.tableView.tableHeaderView = [self getTableHeaderView];
    
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

-(UIView *)getTableHeaderView
{
    return nil;
}

-(UIView *)getTableFooterView
{
    return nil;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.contentArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"infoCell"];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
