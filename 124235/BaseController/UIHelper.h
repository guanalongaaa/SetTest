//
//  UIHelper.h
//  GoComIM
//
//  Created by 王鹏 on 13-4-25.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIHelper : NSObject

+ (UIButton *)msgGreenResizableBtn;
+ (UIButton *)msgGrayResizableBtn;

+ (UIBarButtonItem *)navBackBarBtn:(NSString *)title target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)navBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)navBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action;

//+ (UIButton *)greenBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action;
//
//+ (UIButton *)blueBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action;
//
//+ (UIButton *)redBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (UIButton *)contactsDoneBtn;

+ (UITableViewCell *)switchBtnSetCell;
@end
