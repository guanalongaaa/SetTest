//
//  PPBaseNavViewController.h
//  PPLibTest
//
//  Created by 王鹏 on 13-1-17.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import "PPBaseViewController.h"
#import "UIView+PPCategory.h"
@interface PPBaseNavViewController : PPBaseViewController
@property (nonatomic, retain) UIView *navBar;
@property (nonatomic, retain) UILabel *navLabel;
@property CGFloat navHeight;
@property CGFloat tabBarHeight;
@property (nonatomic, copy) NSString *navBarImageName;
@property (nonatomic, copy) NSString *navTitle;

- (id)initWithNavImageName:(NSString *)imageName Title:(NSString *)title;
- (UIButton *)leftNavBarButton;
- (UIButton *)rightNavBarButton;
- (void)leftNavBarButtonClick:(id)sender;
- (void)rightNavBarButtonClick:(id)sender;
- (void)initNavBar;
- (void)customNavLabel;
@end
