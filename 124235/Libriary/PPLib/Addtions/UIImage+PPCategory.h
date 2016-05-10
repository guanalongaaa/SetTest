//
//  UIImage+PPCategory.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-13.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PPImageRoundCornerModeAll = 0, 
    PPImageRoundCornerModeLeft, 
    PPImageRoundCornerModeTop, 
    PPImageRoundCornerModeRight, 
    PPImageRoundCornerModeBottom, 
    PPImageRoundCornerModeLeftTop, 
    PPImageRoundCornerModeTopRight, 
    PPImageRoundCornerModeRightBottom, 
    PPImageRoundCornerModeBottomLeft
} PPImageRoundCornerMode;

typedef enum {
	PPImageCropModeTopLeft = 0,
	PPImageCropModeTopCenter,
	PPImageCropModeTopRight,
	PPImageCropModeBottomLeft,
	PPImageCropModeBottomCenter,
	PPImageCropModeBottomRight,
	PPImageCropModeLeftCenter,
	PPImageCropModeRightCenter,
	PPImageCropModeCenter
} PPImageCropMode;

@interface UIImage (PPCategory)

/*
 * Stretchable image
 */
- (UIImage *)stretchableImage;
- (UIImage *)stretchableImageWithCapInsets:(UIEdgeInsets)capInsets;

/*
 * Round corner
 */
- (UIImage *)makeRoundCornersOfSize:(CGSize)cornerSize; // All
- (UIImage *)makeRoundCornersOfSize:(CGSize)cornerSize usingMode:(PPImageRoundCornerMode)mode;

/*
 * Cropping
 */
- (UIImage *)cropCenter;
- (UIImage *)cropToSize:(CGSize)newSize; // TopLeft
- (UIImage *)cropToSize:(CGSize)newSize usingMode:(PPImageCropMode)mode;
- (UIImage *)cropAt:(CGRect)rect;
- (UIImage *)cropCenterFitSize:(CGSize)bounds;
/*
 * Scaling
 */
- (UIImage *)scaleToFitSize:(CGSize)bounds;
- (UIImage *)scaleByFactor:(CGFloat)factor;
- (UIImage *)scaleToSize:(CGSize)size;

/*
 * Merging
 */
- (UIImage *)mergeWithImage:(UIImage *)image;
- (UIImage *)mergeAtCenterWithImage:(UIImage *)image;
- (UIImage *)mergeWithImage:(UIImage *)image atPoint:(CGPoint)point;

/*
 * Masking
 */
- (UIImage *)maskWithImage:(UIImage *)image;

/*
 * Filtering
 */
- (UIImage *)sepia;
- (UIImage *)grayscale;
- (UIImage *)negative;

@end
