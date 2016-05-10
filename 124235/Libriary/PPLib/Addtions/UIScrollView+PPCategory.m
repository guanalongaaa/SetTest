//
//  UIScrollView+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-13.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "UIScrollView+PPCategory.h"

@implementation UIScrollView (PPCategory)

- (void)scrollToTopAnimated:(BOOL)animated {
    [self setContentOffset:CGPointZero animated:animated];
}

- (void)scrollToCenterAnimated:(BOOL)animated {
    CGPoint offset = CGPointZero;
    CGFloat height = CGRectGetHeight(self.bounds);
    offset.y = self.contentSize.height - height - height/2.0;
    [self setContentOffset:offset animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated {
    CGPoint offset = CGPointZero;
    CGFloat height = CGRectGetHeight(self.bounds);
    offset.y = self.contentSize.height - height;
    [self setContentOffset:offset animated:animated];
}

- (void)stopScrollingAnimated:(BOOL)animated {
    CGPoint offset = self.contentOffset;
    [self setContentOffset:offset animated:animated];
}

@end
