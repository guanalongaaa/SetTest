//
//  UIBarButtonItem+PPCategory.h
//  PPLibTest
//
//  Created by 王鹏 on 13-3-14.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (PPCategory)
- (id)initWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (id)initWithImage:(UIImage *)image clickImage:(UIImage *)clickImage target:(id)target action:(SEL)action;
@end
