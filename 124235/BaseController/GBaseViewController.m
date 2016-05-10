//
//  GBaseViewController.m
//  124235
//
//  Created by guanalong on 16/4/27.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "GBaseViewController.h"

@interface GBaseViewController ()

@end

@implementation GBaseViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _isViewAppearing = NO;
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.backgroundColor = [self randomColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.shadowOffset = CGSizeMake(0, 0);
        self.navigationItem.titleView = titleLabel;
        
    }
    return self;
}

-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
    UIView *view = self.navigationItem.titleView;
    if ([UIView isKindOfClass:[UILabel class]]) {
        UILabel *titleLabel = (UILabel*)view;
        titleLabel.text = title;
        [titleLabel sizeToFit];
        CGRect f = titleLabel.frame;
        
        titleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - f.size.width/2, 0, f.size.width, 44);
    }
}


-(id)init
{
    self = [super init];
    if (self) {
        _isViewAppearing = NO;
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _isViewAppearing = YES;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    _isViewAppearing = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)navigationBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    return [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:0.7];
}

@end
