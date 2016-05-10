//
//  PPBaseViewController.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-14.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "PPBaseViewController.h"
#import "PPCoreMisc.h"
@interface PPBaseViewController ()

@end

@implementation PPBaseViewController
@synthesize observeKeyboard = _observeKeyboard;
@synthesize isViewAppearing = _isViewAppearing;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _isViewAppearing = NO;
        _observeKeyboard = NO;
        
        UILabel *titleLabel = [[[UILabel alloc]init] autorelease];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:20.f];
        titleLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.shadowOffset = CGSizeMake(0, 0);
        self.navigationItem.titleView = titleLabel;
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    UIView *view = self.navigationItem.titleView;
    if ([view isMemberOfClass:[UILabel class]]) {
        UILabel *titleLabel = (UILabel*)view;
        titleLabel.text = title;
        [titleLabel sizeToFit];
        CGRect f = titleLabel.frame;

        titleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - f.size.width/2, 0, f.size.width, 44);
    }
}

- (id)init
{
    self = [super init];
    if(self)
    {
        _isViewAppearing = NO;
        _observeKeyboard = NO;
    }
    return self;
}

- (void)dealloc 
{
    //[super dealloc];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _isViewAppearing = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    _isViewAppearing = NO;
}

#pragma mark - observe Note
- (void)setObserveKeyboard:(BOOL)observeKeyboard
{
    if (!PPIsBoolEqualToBool(_observeKeyboard, observeKeyboard)) {
        _observeKeyboard = observeKeyboard;
    }

}

#pragma mark - Keyboard


@end
