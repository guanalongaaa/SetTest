//
//  AppProtalBannerView.h
//  124235
//
//  Created by guanalong on 16/5/17.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppProtalBannerView : UIView<UIScrollViewDelegate>
//轮播图
@property (nonatomic, strong)UIScrollView *scrollView;
//翻页控制
@property (nonatomic, strong)UIPageControl *pageControl;
//定时器
@property (nonatomic, strong)NSTimer *timer;
@end
