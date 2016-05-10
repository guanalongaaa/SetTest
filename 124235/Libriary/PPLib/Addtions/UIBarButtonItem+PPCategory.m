//
//  UIBarButtonItem+PPCategory.m
//  PPLibTest
//
//  Created by 王鹏 on 13-3-14.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import "UIBarButtonItem+PPCategory.h"

@implementation UIBarButtonItem (PPCategory)
- (id)initWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
	if((self = [self init]))
	{
		UIButton *cutstomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
		[cutstomBtn setImage:image forState:UIControlStateNormal];
		cutstomBtn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
		[cutstomBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
		self.customView = cutstomBtn;
	}
	return self;
}

- (id)initWithImage:(UIImage *)image clickImage:(UIImage *)clickImage target:(id)target action:(SEL)action{
    if((self = [self init]))
    {
        UIButton *cutstomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cutstomBtn setImage:image forState:UIControlStateNormal];
        [cutstomBtn setImage:clickImage forState:UIControlStateHighlighted];
        cutstomBtn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [cutstomBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        self.customView = cutstomBtn;
    }
    return self;
}
@end
