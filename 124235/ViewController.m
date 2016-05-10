//
//  ViewController.m
//  124235
//
//  Created by smartdot on 16/4/19.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIAlertView+Blocks.h"

#import "SetViewController.h"


@interface ViewController ()
{
    UIView * bgView;
}

//04.26
@property (nonatomic, retain) MBProgressHUD *hud;

@property (nonatomic, retain) SetViewController * setVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [self randomColor];
    [self loadUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadUI
{
    
    CFUUIDRef UUIDObject = CFUUIDCreate(NULL);
    NSString *UUIDString = (NSString *)CFBridgingRelease(CFUUIDCreateString(nil, UUIDObject));
    CFRelease(UUIDObject);
    
    NSLog(@"%@",UUIDString);
//    return [UUIDString autorelease];
    
    //防止block中的循环引用
     typeof (self) weakSelf = self;
    //初始化一个View
    bgView = [[UIView alloc] init];
    bgView.backgroundColor = [self randomColor];
    [self.view addSubview:bgView];
    //使用mas_makeConstraints添加约束
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(weakSelf.view);
        make.edges.mas_offset(UIEdgeInsetsMake(20, 20, 200, 20));
        
//        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    
    
    GALButtonItem *okButton = [GALButtonItem itemWithLabel:@"确定"];
    okButton.action = ^{
        
        //确认 执行 04.26
        UIButton * button = [[UIButton alloc]init];
        [button setTitle:@"刷新" forState:UIControlStateNormal];
        [button setTintColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(refreshButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.backgroundColor = [self randomColor];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(80, 80));
            make.centerX.mas_equalTo(bgView.mas_centerX);
            make.top.equalTo(bgView.mas_bottom).with.offset(20);
            
        }];

    };
    GALButtonItem *cancelButton = [GALButtonItem itemWithLabel:@"取消"];
    cancelButton.action = ^{
        //取消
        //04.25 Add
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.mode = MBProgressHUDModeText;
        self.hud.labelText = @"您取消了展示!!!";
        [self.hud hide:YES afterDelay:2.0f];
    };
    dispatch_async(dispatch_get_main_queue(), ^{
        //提示框
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"确认打开页面?" message:nil cancelButtonItem:okButton otherButtonItems:cancelButton, nil];
        [view show];
    });
    
    
    
    
    
    
}

-(void)refreshButton:(UIButton *)sender
{
    sender.backgroundColor = [self randomColor];
    self.view.backgroundColor = [self randomColor];
    bgView.backgroundColor = [self randomColor];
    
    
//    self.setVC = [[SetViewController alloc]initWithNibName:nil bundle:nil];
//    
//    [self presentViewController:self.setVC animated:YES completion:nil];
    
    
}

-(UIColor *)randomColor
{
    
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    
    return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:0.3f];
}

@end
