//
//  SetViewController.m
//  124235
//
//  Created by guanalong on 16/4/27.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "SetViewController.h"
#import "AppDelegate.h"
#import "GALSettingCell.h"
//语言设置
#import "SettingLanguageViewController.h"
#import "UIHelper.h"

@interface SetViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) UISwitch *setSwitch;
@property (nonatomic, strong) UISwitch *showSwitch;
@end

@implementation SetViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"设置";
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    
    [self initContentArray];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"设置";
    [super viewWillAppear:animated];
    [self initContentArray];
    [self.tableView reloadData];
}

#pragma mark - UITableView DateSource Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contentArray[section] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5.0f;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"sysid";
    
    GALSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[GALSettingCell alloc]initWithReuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *cellInfo = self.contentArray[indexPath.section][indexPath.row];
    
    cell.title = cellInfo[@"title"];
    cell.detail = cellInfo[@"detail"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row == 4) {
        UISwitch *setSwitch = [[UISwitch alloc] init];
        self.setSwitch = setSwitch;
        NSString *switchState = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"SETSWITCHSTR"]] ;
        if (![switchState isEqualToString:@"1"]) {
            [cell.showSwitch setOn:NO];
            [setSwitch setOn:NO];
        }else{
            [cell.showSwitch setOn:YES];
            [setSwitch setOn:YES];
        }
        cell.accessoryView = self.setSwitch;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    if (indexPath.row == 5) {
        
        cell.accessoryView = cell.showSwitch;
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        self.showSwitch = cell.showSwitch;
        NSString *state = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"SETSWITCHSTR"]];
        if ([state isEqualToString:@"0"]) {
            [cell.showSwitch setOn:NO];
        }else{
            [cell.showSwitch setOn:YES];
        }
        
    }

    
    return cell;
}

//05.09 add didSelect
#pragma mark - UITableView Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //第一个分组
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                //设置消息提示
            }
                break;
                
            default:
                break;
        }
    }
    //第二个分组
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                //图像传输
                 break;
            }
            case 1:
            {
                //聊天背景
                 break;
            }
            case 2:
            {
                //聊天字体大小
                 break;
            }
            case 3:
            {
                //清空缓存
                 break;
            }
            case 4:
            {
                //摇一摇清空未读消息
                 break;
            }
            default:
                break;
        }
    }
    //第三个分组
    else if (indexPath.section == 2) {
        //隐私设置
    }
    //第四个分组
    else if (indexPath.section == 3) {
        //多语言设置
        //多语言
        SettingLanguageViewController *slVC = [[SettingLanguageViewController alloc] initWithNibName:nil bundle:nil] ;
        slVC.hidesBottomBarWhenPushed = YES;
        slVC.navigationItem.leftBarButtonItem = [UIHelper navBackBarBtn:self.title target:self action:@selector(navigationBackFromLanguage:)];
        [self.navigationController pushViewController:slVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)navigationBackFromLanguage:(id)sender {
    [super navigationBack:sender];
    [self initContentArray];
    [self.tableView reloadData];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kGOCOMLanguageChangedNote object:nil];
    
}



//05.04
- (NSDictionary *)cellInfoWithTitle:(NSString *)title detail:(id)detail
{
    if (detail)
        return @{@"title" : title, @"detail" : detail};
    else
        return @{@"title" : title};
    
}

-(void)initContentArray
{
    self.contentArray = [NSMutableArray array];
    
    //新消息提示
    NSArray * firstSectionArray = @[[self cellInfoWithTitle:@"新消息提示" detail:nil]];
    
    //常规
    NSArray *secondSectionArray  = @[[self cellInfoWithTitle:@"图像传输" detail:[self selectedValue]],[self cellInfoWithTitle:@"聊天背景" detail:nil],[self cellInfoWithTitle:@"聊天字体大小" detail:nil],[self cellInfoWithTitle:@"清空聊天记录" detail:nil],[self cellInfoWithTitle:@"摇一摇清空未读消息" detail:nil]];
    
    //隐私
    NSArray *clearRecordArray = @[[self cellInfoWithTitle:@"隐私" detail:nil]];
    
    //多语言
    NSArray *languageArray = @[[self cellInfoWithTitle:@"多语言" detail:[del languageDisplayNameFromUserDefaults]]];
    
    //添加第一个分组
    [self.contentArray addObject:firstSectionArray];
    //添加第二个分组
    [self.contentArray addObject:secondSectionArray];
    //隐私
    [self.contentArray addObject:clearRecordArray];
    //多语言设置
    [self.contentArray addObject:languageArray];
    NSLog(@"%@",languageArray);
 
}



- (NSString *)selectedValue{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger resualt = [defaults integerForKey:@"sendpic"];
    if (resualt == YES) {
        return @"压缩";
    }else
        return @"原图";
}


@end
