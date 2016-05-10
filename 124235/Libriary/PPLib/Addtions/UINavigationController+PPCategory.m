//
//  UINavigationController+PPCategory.m
//  PPLibTest
//
//  Created by 王鹏 on 13-3-14.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import "UINavigationController+PPCategory.h"
#import "UINavigationBar+PPCategory.h"
@implementation UINavigationController (PPCategory)
- (id)initWithRootViewController:(UIViewController *)rootViewController navigationBarBackgroundImage:(UIImage *)backgroundImage
{
	self = [self initWithRootViewController:rootViewController];
	if(self)
	{
        //self.navigationBar.barTintColor = [UIColor whiteColor];
		[self.navigationBar setBackgroundImage:backgroundImage];
        
	}
	return self;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return UIStatusBarStyleLightContent;
}
@end
