//
//  WBBlurImageView.m
//
//  Created by Weibai Lu on 1/4/14.
//  Copyright (c) 2014 Delve. All rights reserved.
//

#import "WBBlurImageView.h"
#import "UIImage+WB.h"

@interface WBBlurImageView()
/**
 *  需要模糊的图片
 */
@property (strong, nonatomic) UIImage *baseImage;
/**
 *  正向存放所有动画模糊的图片
 */
@property (strong) NSMutableArray *framesArray;
/**
 *  反向存放所有动画模糊的图片
 */
@property (strong) NSMutableArray *framesReverseArray;
/**
 *  图片数量
 */
@property (assign) NSInteger framesCount;
/**
 *  模糊级别
 */
@property (nonatomic) CGFloat blurAmount;
/**
 *  模糊颜色
 */
@property (strong) UIColor *blurTintColor;

@end

@implementation WBBlurImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //默认设置
        self.animationDuration = 0.1f;
        self.animationRepeatCount = 1;
    }
    return self;
}

+ (instancetype)blurImageViewWithFrame:(CGRect)frame baseImage:(UIImage *)baseImage framesCount:(NSInteger)framesCount blurAmount:(CGFloat)blurAmount blurTintColor:(UIColor *)blurTintColor
{
    WBBlurImageView *imageView = [[WBBlurImageView alloc] initWithFrame:frame];
    imageView.framesCount = framesCount;
    imageView.blurAmount = blurAmount;
    imageView.blurTintColor = blurTintColor;
    imageView.baseImage = baseImage;
    return imageView;
}

- (void)setBaseImage:(UIImage *)baseImage framesCount:(NSInteger)framesCount blurAmount:(CGFloat)blurAmount blurTintColor:(UIColor *)blurTintColor
{
    self.framesCount = framesCount;
    self.blurAmount = blurAmount;
    self.blurTintColor = blurTintColor;
    self.baseImage = baseImage;
}

- (void)setBaseImage:(UIImage *)baseImage
{
    _baseImage = baseImage;

    if (self.blurAmount == 0) {
        self.blurAmount = 0.4;
    }
    //生成所有模糊图片
    [self generateBlurFramesWithCompletion:^{}];
}

/**
 *  清除所有数据
 */
- (void)removeImages
{
    self.baseImage = nil;
    self.image = nil;
    [self.framesArray removeAllObjects];
    self.framesArray = nil;
    [self.framesReverseArray removeAllObjects];
    self.framesReverseArray = nil;
}

#pragma mark -
#pragma mark Animation Methods
-(void)generateBlurFramesWithCompletion:(void(^)())completion{
    
    // Reset our arrays. Generate our reverse array at the same time to save work later on blurOut.
    _framesArray = [[NSMutableArray alloc]init];
    _framesReverseArray = [[NSMutableArray alloc]init];
    

    NSInteger frames = 4;
    if (_framesCount)
        frames = _framesCount;
    
    if (!_blurTintColor)
        _blurTintColor = [UIColor clearColor];
    
    // Set our blur amount, 0-1 if availabile.
    // If < 0, reset to lowest blur. If > 1, reset to highest blur.
    CGFloat blurLevel = _blurAmount;
    if (_blurAmount < 0.0f || !_blurAmount)
        blurLevel = 0.1f;
    
    if (_blurAmount > 1.0f)
        blurLevel = 1.0f;
    //为了性能降低图片质量
    UIImage *downsampledImage = [self.baseImage downsSizeImage];
    
    // Create our array, set each image as a spot in the array.
    for (int i = 0; i < frames; i++){
        UIImage *blurredImage = [downsampledImage blurImageWithBlur:((CGFloat)i/frames)*blurLevel withTintColor:[_blurTintColor colorWithAlphaComponent:(CGFloat)i/frames * CGColorGetAlpha(_blurTintColor.CGColor)]];
        
        if (blurredImage){
            // Our normal animation.
            [_framesArray addObject:blurredImage];
            // Our reverse animation.
            [_framesReverseArray insertObject:blurredImage atIndex:0];
        }
        
    }
    completion();
    
}

-(void)blurInAnimationWithDuration:(CGFloat)duration{
    
    // Set our duration.
    self.animationDuration = duration;
    
    // Set our forwards image array;
    self.animationImages = _framesArray;
    
    // Set our image to the last image to make sure it's permanent on animation end.
    [self setImage:[_framesArray lastObject]];
    
    // BOOM! Blur in.
    [self startAnimating];
}

-(void)blurOutAnimationWithDuration:(CGFloat)duration{
    
    // Set our duration.
    self.animationDuration = duration;
    
    // Set our reverse image array.
    self.animationImages = _framesReverseArray;
    
    // Set our end frame.
    [self setImage:_baseImage];
    
    // BOOM! Blur out.
    [self startAnimating];
}

-(void)blurInAnimationWithDuration:(CGFloat)duration completion:(void(^)())completion{
    
    // Call our blurout with the correct duration.
    [self blurInAnimationWithDuration:duration];
    
    // 回调
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, self.animationDuration * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if(completion){
            completion();
        }
    });
}

-(void)blurOutAnimationWithDuration:(CGFloat)duration completion:(void(^)())completion{
    
    // Call our blurout with the correct duration.
    [self blurOutAnimationWithDuration:duration];
    
    // 回调
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, self.animationDuration * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if(completion){
            completion();
        }
    });
}


@end
