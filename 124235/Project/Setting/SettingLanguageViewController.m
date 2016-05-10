//
//  SettingLanguageViewController.m
//  124235
//
//  Created by guanalong on 16/5/9.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "SettingLanguageViewController.h"
#import "AppDelegate.h"
#import "GALLanguageSetCell.h"

@interface SettingLanguageViewController ()

@property (nonatomic, copy) NSString *currentlanguage;

@end

@implementation SettingLanguageViewController

-(void)dealloc
{
    self.currentlanguage = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
     // Do any additional setup after loading the view.
    
    [self setTitle: @"多语言"];
    self.contentArray = [NSMutableArray arrayWithObjects:@[LANGUAGE_NONE_DISPLAY_NAME, LANGUAGE_CHINESE_SIMPLIFIED_DISPLAY_NAME, LANGUAGE_CHINESE_TRADITIONAL_DISPLAY_NAME, LANGUAGE_ENGLISH_DISPLAY_NAME], nil];
    self.currentlanguage = [del languageDisplayNameFromUserDefaults];
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contentArray[0] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden = @"GCell";
    GALLanguageSetCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[GALLanguageSetCell alloc] initWithReuseIdentifier:iden];
    }
    cell.textLabel.text = self.contentArray[indexPath.section][indexPath.row];
    
    if ([cell.textLabel.text isEqualToString:self.currentlanguage]) {
        //        [cell setSelected:YES animated:NO];
        [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *languageName = self.contentArray[indexPath.section][indexPath.row];
    [del setLanguageForUserDefaultsWithLanguageName:languageName];
    self.currentlanguage = languageName;
    
    NSArray *titles = [NSArray arrayWithObjects:@"首页",@"设置", nil];
    for (NSInteger i = 0; i<titles.count; i++) {
        UITabBarItem *item = del.tabBarController.tabBar.items[i];
        item.title = titles[i];
    }
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
