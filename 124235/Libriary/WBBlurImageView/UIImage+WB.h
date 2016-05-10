//
//  UIImage+WB.h
//  工具库
//
//  Created by 卢苇白 on 14-4-19.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WB)

/**
 *  返回一个已经拉伸好的图片
 *
 *  @param name      图片名
 *  @param topScale  顶部需要保留的比例 0 - 1
 *  @param leftScale 左边需要保留的比例 0 - 1
 *
 *  @return 拉伸好的图片
 */
+ (UIImage *)imageWithName: (NSString *)name topScale: (CGFloat)topScale leftScale: (CGFloat)leftScale;

/**
 *  返回一个可拉伸图片，拉伸位置为正中间
 */
- (UIImage *)resizableImage;

/**
 *  返回一个圆形裁剪图片
 * @param name  图片名字
 *  @param borderWidth  边框宽度
 *  @param borderColor 边框颜色
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  返回自动判断是否为iOS7的图片
 *  @param name 图片名
 */
+ (UIImage *)imageWithName: (NSString *)name;


/** 模糊图片 */
- (UIImage*)blurImageWithBlur:(CGFloat)blur;

/** 在tintColor基础上模糊图片 */
- (UIImage*)blurImageWithBlur:(CGFloat)blur withTintColor:(UIColor*)tintColor;
/**
 *  降低图片质量
 */
- (UIImage *)downsSizeImage;

/**
 *  在一个view上截图
 */
+ (UIImage *)capture:(UIView *)view;

/**
 *  全屏截图
 *
 *  @return 截完图的图片
 */
+ (UIImage *)captureScreen;

@end
