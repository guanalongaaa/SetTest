//
//  UINavigationBar+PPCategory.m
//  PPLibTest
//
//  Created by 王鹏 on 13-3-14.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import "UINavigationBar+PPCategory.h"
#import "PPCore.h"
#import <QuartzCore/QuartzCore.h>
@implementation UINavigationBar (PPCategory)
- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    UIImage *navBackImage =nil;
    
    navBackImage = [UIImage imageWithName:@"topbarbg" topScale:0.5 leftScale:0.5];
    
    [self setBackgroundImage:navBackImage forBarMetrics:UIBarMetricsDefault];
    
	[self setNeedsDisplay];
}
@end
