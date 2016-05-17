//
//  AppProtalBannerView.m
//  124235
//
//  Created by guanalong on 16/5/17.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "AppProtalBannerView.h"

@implementation AppProtalBannerView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //add 轮播图
        [self addScrollViewWithFrame:frame];
        //add 分页控制
        [self addPageControlWithFrame:frame];
        //add 定时器
        [self addTimer];
    }
    return self;
}

-(void)addScrollViewWithFrame:(CGRect)frame
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:frame];
    self.scrollView.backgroundColor = [UIColor clearColor];
    for (int i = 0; i < 3; i++) {
        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(IMScreenWidth * i, 0, IMScreenWidth, 120)];
        imageV.backgroundColor = [self randomColor];
        [self.scrollView addSubview:imageV];
    }
    self.scrollView.contentSize = CGSizeMake(IMScreenWidth * 3, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
}

-(void)addPageControlWithFrame:(CGRect)frame
{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((frame.size.width - 90)/2, frame.size.height - 40, 90, 20)];
    self.pageControl.numberOfPages = 3;
    [self addSubview:self.pageControl];
}

-(void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}
-(void)removeTimer{
    [self.timer invalidate];
}
-(void)nextImage{
    int page = (int)self.pageControl.currentPage;
    if (page == (self.pageControl.numberOfPages - 1)) {
        page = 0;
    }else{
        page++;
    }
    //根据page滑动Scrollview
    CGFloat x = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    
}


#pragma mark - scrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2) / scrollViewW;
    self.pageControl.currentPage = page;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //add 定时器
    [self addTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self removeTimer];
}


//color
-(UIColor *)randomColor
{
    float r = arc4random_uniform(255.0);
    float g = arc4random_uniform(255.0);
    float b = arc4random_uniform(255.0);
    
    
    return [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:0.7];
    
}
@end
