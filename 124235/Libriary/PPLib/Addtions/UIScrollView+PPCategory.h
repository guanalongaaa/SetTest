//
//  UIScrollView+PPCategory.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-13.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (PPCategory)

- (void)scrollToTopAnimated:(BOOL)animated;
- (void)scrollToCenterAnimated:(BOOL)animated;
- (void)scrollToBottomAnimated:(BOOL)animated;
- (void)stopScrollingAnimated:(BOOL)animated;

@end
