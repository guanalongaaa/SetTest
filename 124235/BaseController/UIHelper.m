//
//  UIHelper.m
//  GoComIM
//
//  Created by 王鹏 on 13-4-25.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import "UIHelper.h"
#import "UIImage+PPCategory.h"
#import "UIButton+PPCategory.h"
#import "PPCore.h"
#import "AppDelegate.h"

@implementation UIHelper
+ (UIButton *)commonResizableImageBtn:(UIImage *)image
{
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.frame = CGRectMake(0, 0, 47, 31);
	[btn setBackgroundImage:[image stretchableImageWithCapInsets:UIEdgeInsetsMake(20, 10, 15, 20)] forState:UIControlStateNormal];
	
	return btn;
}


+ (UIButton *)msgGreenResizableBtn
{
	return [UIHelper commonResizableImageBtn:[UIImage imageNamed:@"msg_btn_green.png"]];
}

+ (UIButton *)msgGrayResizableBtn
{
	return [UIHelper commonResizableImageBtn:[UIImage imageNamed:@"msg_btn_gray.png"]];
}

+ (UIBarButtonItem *)navBackBarBtn:(NSString *)title target:(id)target action:(SEL)action
{

	UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];

	customBtn.frame = CGRectMake(0, 0, 30, 30);
    
    
	UIImage *img = [UIImage imageNamed:@"jiantou_left"];
    
	[customBtn setImage:img forState:UIControlStateNormal];
    
	[customBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customBtn];
	return item;
}

+ (UIBarButtonItem *)navBarButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    customBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
	CGSize size = [title sizeWithFont:customBtn.titleLabel.font];
	customBtn.frame = CGRectMake(0, 0, 15+10+size.width, 30);
    [customBtn setTitle:title forState:UIControlStateNormal];
	[customBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
	customBtn.titleLabel.shadowOffset = CGSizeMake(0, -1);
	customBtn.titleLabel.shadowColor = UICOLOR_RGB(0, 70, 116);
    
    //UIImage *img = [[UIImage imageNamed:@"nav_btn"] stretchableImageWithCapInsets:UIEdgeInsetsMake(4.0, 4.0, 4.0, 4.0)];
   // [customBtn setBackgroundImage:img forState:UIControlStateNormal];
    [customBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customBtn];
    return item;
}

+ (UIBarButtonItem *)navBarButtonWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
	UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	customBtn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	[customBtn setBackgroundImage:image forState:UIControlStateNormal];
	[customBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customBtn];
	return item ;
}


+ (UIButton *)customBtnWithbgImage:(UIImage *)image title:(NSString *)title target:(id)target action:(SEL)action
{
	UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	customBtn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	[customBtn setBackgroundImage:image forState:UIControlStateNormal];
	[customBtn setTitle:title forState:UIControlStateNormal];
	customBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
	customBtn.titleLabel.shadowColor = [UIColor grayColor];
	customBtn.titleLabel.shadowOffset = CGSizeMake(0, 1);
	[customBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
	return customBtn;
}

//+ (UIButton *)greenBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action
//{
//	UIImage *img = [UIImage imageWithName:@"baocuntxl" topScale:0.5 leftScale:0.5];
//	return [UIHelper customBtnWithbgImage:img title:title target:target action:action];
//}
//
//+ (UIButton *)blueBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action
//{
//	UIImage *img = [UIImage imageWithName:@"login_btnbj" topScale:0.5 leftScale:0.5];
//	return [UIHelper customBtnWithbgImage:img title:title target:target action:action];
//}
//
//+ (UIButton *)redBtnWithTitle:(NSString *)title target:(id)target action:(SEL)action
//{
//	UIImage *img = [UIImage imageWithName:@"out_red_btn" topScale:0.5 leftScale:0.5];
//	return [UIHelper customBtnWithbgImage:img title:title target:target action:action];
//}

//+ (UIButton *)contactsDoneBtn
//{
//	UIImage *img = [UIImage imageWithName:@"baocuntxl_hover" topScale:0.5 leftScale:0.5] ;
//	UIButton *btn = [UIHelper customBtnWithbgImage:img title:@"已添加" target:nil action:nil];
//	[btn setBackgroundImage:img forState:UIControlStateDisabled];
//	//[btn setImage:[UIImage imageWithName:@"baocuntxl_hover" topScale:0.5 leftScale:0.5] forState:UIControlStateDisabled];
//	[btn setTitle:@"已添加" forState:UIControlStateDisabled];
//    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0.0, -10.0, 0.0, 0.0);
//	btn.enabled = NO;
//	return btn;
//}

+ (UITableViewCell *)switchBtnSetCell
{
	UITableViewCell *cell;
	cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"switchbtnSetCell"];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	//	cell.contentView.backgroundColor = [UIColor clearColor];
	//	cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
	//	cell.textLabel.backgroundColor = [UIColor clearColor];
	//	cell.textLabel.font = SHOUYEFONTBOLD(15.0f);
	cell.textLabel.textColor = [UIColor blackColor];
	//	cell.textLabel.shadowColor = UICOLOR_RGB(16, 39, 0);
	//	cell.textLabel.shadowOffset = SHOUYESHADOWRECT;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}

@end
