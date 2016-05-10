//
//  WBBlurImageView.h
//
//  Created by Weibai Lu on 1/4/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBBlurImageView : UIImageView
/**
 *  初始化一个blurImageView
 *
 *  @param frame     边框大小
 *  @param baseImage     需要模糊的图片
 *  @param framesCount   帧数，为性能着想默认是3
 *  @param blurAmount    模糊程度0-1之间
 *  @param blurTintColor 模糊的颜色
 */
+ (instancetype)blurImageViewWithFrame: (CGRect)frame baseImage: (UIImage *)baseImage framesCount: (NSInteger)framesCount blurAmount: (CGFloat)blurAmount blurTintColor: (UIColor *)blurTintColor;
/**
 *  配置一个blurImageView
 *
 *  @param baseImage     需要模糊的图片
 *  @param framesCount   帧数，为性能着想默认是3
 *  @param blurAmount    模糊程度0-1之间
 *  @param blurTintColor 模糊的颜色
 */
- (void)setBaseImage: (UIImage *)baseImage framesCount: (NSInteger)framesCount blurAmount: (CGFloat)blurAmount blurTintColor: (UIColor *)blurTintColor;

/**
 正向播放模糊动画
 */
-(void)blurInAnimationWithDuration:(CGFloat)duration;

-(void)blurInAnimationWithDuration:(CGFloat)duration completion:(void(^)())completion;

/**
 反向播放模糊动画
 */
-(void)blurOutAnimationWithDuration:(CGFloat)duration;

-(void)blurOutAnimationWithDuration:(CGFloat)duration completion:(void(^)())completion;

/**
 *  清空所有图片信息
 */
- (void)removeImages;


@end
