//
//  ProtalViewController.m
//  124235
//
//  Created by guanalong on 16/5/17.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "ProtalViewController.h"
#import "AppProtalBannerView.h"

@interface ProtalViewController()

//轮播图
@property (nonatomic, strong)AppProtalBannerView *bannerView;
@end

@implementation ProtalViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
        [self addBannerView];
    }
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"视图";
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addBannerView];
}

-(void)addBannerView{
    self.bannerView = [[AppProtalBannerView alloc]initWithFrame:CGRectMake(0, 0, IMScreenWidth, 140)];
    [self.view addSubview:self.bannerView];
}
@end
