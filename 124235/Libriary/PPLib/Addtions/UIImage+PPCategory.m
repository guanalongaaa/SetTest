//
//  UIImage+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-13.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "UIImage+PPCategory.h"
#import "PPCoreSys.h"
@implementation UIImage (PPCategory)

#pragma mark - Stretchable image

- (UIImage *)stretchableImage {
    CGFloat semiHeight = floor(self.size.height/2.0);
    if (semiHeight<1.0) semiHeight = 1.0;
    
    CGFloat semiWidth = floor(self.size.width/2.0);
    if (semiWidth<1.0) semiWidth = 1.0;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(semiHeight-1.0, semiWidth-1.0, semiHeight-1.0, semiWidth-1.0);
    return [self stretchableImageWithCapInsets:edgeInsets];
}

- (UIImage *)stretchableImageWithCapInsets:(UIEdgeInsets)capInsets {
    if (PPIOSVersion() < 5.0)
        return [self stretchableImageWithLeftCapWidth:capInsets.left topCapHeight:capInsets.top];
    
    return [self resizableImageWithCapInsets:capInsets];
}


#pragma mark - Round corner

- (UIImage *)makeRoundCornersOfSize:(CGSize)cornerSize {
    return [self makeRoundCornersOfSize:cornerSize usingMode:PPImageRoundCornerModeAll];
}

- (UIImage *)makeRoundCornersOfSize:(CGSize)cornerSize usingMode:(PPImageRoundCornerMode)mode {
    if (cornerSize.width <= 0.0 || cornerSize.height <= 0.0) {
        return self;
    }
	
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, self.size.width, self.size.height, 8, 4*self.size.width, colorSpace, kCGImageAlphaPremultipliedFirst);
	CGColorSpaceRelease(colorSpace);
    
    CGContextBeginPath(context);
    CGContextSaveGState(context);
    CGContextTranslateCTM (context, 0.0, 0.0);
    CGContextScaleCTM (context, cornerSize.width, cornerSize.height);
    CGFloat fw = self.size.width / cornerSize.width;
    CGFloat fh = self.size.height / cornerSize.height;
    if (mode == PPImageRoundCornerModeLeft) {
        CGContextMoveToPoint(context, fw/2.0, fh);
        CGContextAddArcToPoint(context, 0.0, fh, 0.0, fh/2.0, 1.0);
        CGContextAddArcToPoint(context, 0.0, 0.0, fw/2.0, 0.0, 1.0);
        CGContextAddLineToPoint(context, fw, 0.0);
        CGContextAddLineToPoint(context, fw, fh);
        CGContextAddLineToPoint(context, fw/2.0, fh);
    } else if (mode == PPImageRoundCornerModeTop) {
        CGContextMoveToPoint(context, fw, fh/2.0);
        CGContextAddArcToPoint(context, fw, fh, fw/2.0, fh, 1.0);
        CGContextAddArcToPoint(context, 0.0, fh, 0.0, fh/2.0, 1.0);
        CGContextAddLineToPoint(context, 0.0, 0.0);
        CGContextAddLineToPoint(context, fw, 0.0);
        CGContextAddLineToPoint(context, fw, fh/2.0);
    } else if (mode == PPImageRoundCornerModeRight) {
        CGContextMoveToPoint(context, fw/2.0, 0.0);
        CGContextAddArcToPoint(context, fw, 0.0, fw, fh/2.0, 1.0);
        CGContextAddArcToPoint(context, fw, fh, fw/2.0, fh, 1.0);
        CGContextAddLineToPoint(context, 0.0, fh);
        CGContextAddLineToPoint(context, 0.0, 0.0);
        CGContextAddLineToPoint(context, fw/2.0, 0.0);
    } else if (mode == PPImageRoundCornerModeBottom) {
        CGContextMoveToPoint(context, 0.0, fh/2.0);
        CGContextAddArcToPoint(context, 0.0, 0.0, fw/2.0, 0.0, 1.0);
        CGContextAddArcToPoint(context, fw, 0.0, fw, fh/2.0, 1.0);
        CGContextAddLineToPoint(context, fw, fh);
        CGContextAddLineToPoint(context, 0.0, fh);
        CGContextAddLineToPoint(context, 0.0, fh/2.0);
    } else if (mode == PPImageRoundCornerModeLeftTop) {
        CGContextMoveToPoint(context, fw/2.0, fh);
        CGContextAddArcToPoint(context, 0.0, fh, 0.0, fh/2.0, 1.0);
        CGContextAddLineToPoint(context, 0.0, 0.0);
        CGContextAddLineToPoint(context, fw, 0.0);
        CGContextAddLineToPoint(context, fw, fh);
        CGContextAddLineToPoint(context, fw/2.0, fh);
    } else if (mode == PPImageRoundCornerModeTopRight) {
        CGContextMoveToPoint(context, fw, fh/2.0);
        CGContextAddArcToPoint(context, fw, fh, fw/2.0, fh, 1.0);
        CGContextAddLineToPoint(context, 0.0, fh);
        CGContextAddLineToPoint(context, 0.0, 0.0);
        CGContextAddLineToPoint(context, fw, 0.0);
        CGContextAddLineToPoint(context, fw, fh/2.0);
    } else if (mode == PPImageRoundCornerModeRightBottom) {
        CGContextMoveToPoint(context, fw/2.0, 0.0);
        CGContextAddArcToPoint(context, fw, 0.0, fw, fh/2.0, 1.0);
        CGContextAddLineToPoint(context, fw, fh);
        CGContextAddLineToPoint(context, 0.0, fh);
        CGContextAddLineToPoint(context, 0.0, 0.0);
        CGContextAddLineToPoint(context, fw/2.0, 0.0);
    } else if (mode == PPImageRoundCornerModeBottomLeft) {
        CGContextMoveToPoint(context, 0.0, fh/2.0);
        CGContextAddArcToPoint(context, 0.0, 0.0, fw/2.0, 0.0, 1.0);
        CGContextAddLineToPoint(context, fw, 0.0);
        CGContextAddLineToPoint(context, fw, fh);
        CGContextAddLineToPoint(context, 0.0, fh);
        CGContextAddLineToPoint(context, 0.0, fh/2.0);
    } else {
        CGContextMoveToPoint(context, fw, fh/2.0);
        CGContextAddArcToPoint(context, fw, fh, fw/2.0, fh, 1.0);
        CGContextAddArcToPoint(context, 0.0, fh, 0.0, fh/2.0, 1.0);
        CGContextAddArcToPoint(context, 0.0, 0.0, fw/2.0, 0.0, 1.0);
        CGContextAddArcToPoint(context, fw, 0.0, fw, fh/2.0, 1.0);
    }
    CGContextClosePath(context);
    CGContextRestoreGState(context);
    CGContextClip(context);
	
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, self.size.width, self.size.height), self.CGImage);
    CGImageRef maskedImageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedImageRef];
    CGImageRelease(maskedImageRef);
	
    return maskedImage;
}



#pragma mark - Cropping
- (UIImage *)cropCenterFitSize:(CGSize)bounds
{
    CGFloat factor1 = bounds.width/self.size.width;
    CGFloat factor2 = bounds.height/self.size.height;
    CGSize newsize;
	if (factor1 > factor2)
	{
		newsize.height = self.size.height *factor1;
		newsize.width = self.size.width *factor1;
	}
	else
	{
		newsize.width = self.size.width *factor2;
		newsize.height = self.size.height *factor2;
	}
	UIImage *img = [self scaleToSize:newsize];
	
	if (factor1 > factor2)
	{
		newsize.width = img.size.width;
		newsize.height = img.size.width * bounds.height / bounds.width;
	}
	else
	{
		newsize.height = img.size.height;
		newsize.width = img.size.height * bounds.width/ bounds.height;
	}
	return [img cropToSize:newsize usingMode:PPImageCropModeCenter];
}


- (UIImage *)cropCenter {
    CGFloat width = MIN(self.size.width, self.size.height);
    return [self cropToSize:CGSizeMake(width, width) usingMode:PPImageCropModeCenter];
}

- (UIImage *)cropToSize:(CGSize)newSize {
	return [self cropToSize:newSize usingMode:PPImageCropModeTopLeft];
}

- (UIImage *)cropToSize:(CGSize)newSize usingMode:(PPImageCropMode)mode {
	CGFloat x = 0.0;
    CGFloat y = 0.0;
	switch (mode) {
		case PPImageCropModeTopLeft:
            x = 0.0;
            y = 0.0;
			break;
		case PPImageCropModeTopCenter:
			x = (self.size.width - newSize.width) * 0.5;
			y = 0.0;
			break;
		case PPImageCropModeTopRight:
			x = self.size.width - newSize.width;
			y = 0.0;
			break;
		case PPImageCropModeBottomLeft:
			x = 0.0;
			y = self.size.height - newSize.height;
			break;
		case PPImageCropModeBottomCenter:
			x = newSize.width * 0.5;
			y = self.size.height - newSize.height;
			break;
		case PPImageCropModeBottomRight:
			x = self.size.width - newSize.width;
			y = self.size.height - newSize.height;
			break;
		case PPImageCropModeLeftCenter:
			x = 0.0;
			y = (self.size.height - newSize.height) * 0.5;
			break;
		case PPImageCropModeRightCenter:
			x = self.size.width - newSize.width;
			y = (self.size.height - newSize.height) * 0.5;
			break;
		case PPImageCropModeCenter:
			x = (self.size.width - newSize.width) * 0.5;
			y = (self.size.height - newSize.height) * 0.5;
			break;
		default: // Default to top left
			x = 0.0;
            y = 0.0;
			break;
	}
    
    return [self cropAt:CGRectMake(x, y, newSize.width, newSize.height)];
}

- (UIImage *)cropAt:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return image;
}



#pragma mark - Scaling

- (UIImage *)scaleToFitSize:(CGSize)bounds
{
    CGFloat factor1 = bounds.width/self.size.width;
    CGFloat factor2 = bounds.height/self.size.height;
    CGFloat factor = MIN(factor1, factor2);
//	    return [self scaleByFactor:factor];
	CGFloat resultWidth = self.size.width * factor;
	CGFloat resultHeight = self.size.height * factor;
    return [self scaleToSize:CGSizeMake(resultWidth, resultHeight)];
}

- (UIImage *)scaleByFactor:(CGFloat)factor
{
	CGFloat resultWidth = ceil(self.size.width * factor);
	CGFloat resultHeight = ceil(self.size.height * factor);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate(NULL,
                                                 resultWidth,
                                                 resultHeight,
                                                 8,
                                                 resultWidth*4,
                                                 colorSpace,
                                                 kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
	CGColorSpaceRelease(colorSpace);
	
	// Handle orientation
	if ( UIImageOrientationLeft == self.imageOrientation ) {
		CGContextRotateCTM(context, M_PI_2);
		CGContextTranslateCTM(context, 0.0, -resultHeight);
	} else if ( UIImageOrientationRight == self.imageOrientation ) {
		CGContextRotateCTM(context, -M_PI_2);
		CGContextTranslateCTM(context, -resultWidth, 0.0);
	} else if ( UIImageOrientationDown == self.imageOrientation ) {
		CGContextTranslateCTM(context, resultWidth, resultHeight);
		CGContextRotateCTM(context, -M_PI);
	}
    
	// Image quality
	CGContextSetShouldAntialias(context, true);
	CGContextSetAllowsAntialiasing(context, true);
	CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    
	// Draw the image in the bitmap context
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, resultWidth, resultHeight), self.CGImage);
	CGImageRef scaledImageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
	UIImage *scaledImage = [UIImage imageWithCGImage:scaledImageRef];
	CGImageRelease(scaledImageRef);
	
	return scaledImage;
}

- (UIImage *)scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0.0, 0.0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}



#pragma mark - Merging

- (UIImage *)mergeWithImage:(UIImage *)image {
    return [self mergeWithImage:image atPoint:CGPointZero];
}

- (UIImage *)mergeAtCenterWithImage:(UIImage *)image {
    CGFloat x = (self.size.width - image.size.width) / 2.0;
    CGFloat y = (self.size.height - image.size.height) / 2.0;
    return [self mergeWithImage:image atPoint:CGPointMake(x, y)];
}

- (UIImage *)mergeWithImage:(UIImage *)image atPoint:(CGPoint)point {
    if (image == nil) {
        return self;
    }
    
    UIGraphicsBeginImageContext(self.size);
    [self drawAtPoint:CGPointZero];
    [image drawAtPoint:point];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}


#pragma mark - Masking

- (UIImage *)maskWithImage:(UIImage *)image {
	CGImageRef maskRef = image.CGImage;
    CGImageRef sourceRef = self.CGImage;
    
	CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
	
	CGImageRef imageWithAlpha = sourceRef;
	// Add alpha channel for images that don't have one (ie GIF, JPEG, etc...). This however has a computational cost.
	if (CGImageGetAlphaInfo(sourceRef) == kCGImageAlphaNone) {
        size_t width = CGImageGetWidth(sourceRef);
        size_t height = CGImageGetHeight(sourceRef);
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        CGContextRef offscreenContext = CGBitmapContextCreate(NULL, width, height, 
                                                              8, 0, colorSpace, kCGImageAlphaPremultipliedFirst);
        
        if (offscreenContext != NULL) {
            CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), sourceRef);
            
            imageWithAlpha = CGBitmapContextCreateImage(offscreenContext);
            CGContextRelease(offscreenContext);
        }
        
        CGColorSpaceRelease(colorSpace);
	}
	
	CGImageRef masked = CGImageCreateWithMask(imageWithAlpha, mask);
	CGImageRelease(mask);
	
	// Release imageWithAlpha if it was created
	if (sourceRef != imageWithAlpha) {
		CGImageRelease(imageWithAlpha);
	}
	
	UIImage *resultImage = [UIImage imageWithCGImage:masked];
	CGImageRelease(masked);
	
	return resultImage;
}


#pragma mark - Filtering

- (UIImage *)sepia {
	CGFloat originalWidth = self.size.width;
	CGFloat originalHeight = self.size.height;
	size_t bytesPerRow = originalWidth * 4;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate(NULL, originalWidth, originalHeight, 8, bytesPerRow, colorSpace, 
                                                 kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
	CGColorSpaceRelease(colorSpace);
	if (!context) return nil;
    
	// Draw the image in the bitmap context
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, originalWidth, originalHeight), self.CGImage);
    
	/// Grab the image raw data
	UInt8 *data = (UInt8 *)CGBitmapContextGetData(context);
	if (!data) {
		CGContextRelease(context);
		return nil;
	}
    
	const size_t bitmapByteCount = bytesPerRow * originalHeight;
	for (size_t i = 0; i < bitmapByteCount; i += 4) {
		UInt8 r = data[i + 1];
		UInt8 g = data[i + 2];
		UInt8 b = data[i + 3];
        
		NSInteger newRed = (r * 0.393) + (g * 0.769) + (b * 0.189);
		NSInteger newGreen = (r * 0.349) + (g * 0.686) + (b * 0.168);
		NSInteger newBlue = (r * 0.272) + (g * 0.534) + (b * 0.131);
        
		if (newRed > 255) newRed = 255;
		if (newGreen > 255) newGreen = 255;
		if (newBlue > 255) newBlue = 255;
        
		data[i + 1] = (UInt8)newRed;
		data[i + 2] = (UInt8)newGreen;
		data[i + 3] = (UInt8)newBlue;
	}
    
	CGImageRef sepiaImageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
	UIImage *sepiaImage = [UIImage imageWithCGImage:sepiaImageRef];
	CGImageRelease(sepiaImageRef);
    
	return sepiaImage;
}

- (UIImage *)grayscale {
	CGFloat originalWidth = self.size.width;
	CGFloat originalHeight = self.size.height;
    
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
	CGContextRef context = CGBitmapContextCreate(NULL, originalWidth, originalHeight, 8, 3 * originalWidth, colorSpace, kCGImageAlphaNone);
	CGColorSpaceRelease(colorSpace);
	if (!context) return nil;
    
    
	// Image quality
	CGContextSetShouldAntialias(context, false);
	CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    
	// Draw the image in the bitmap context
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, originalWidth, originalHeight), self.CGImage);
    
	// Create an image object from the context
	CGImageRef grayscaleImageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
	UIImage *grayscaleImage = [UIImage imageWithCGImage:grayscaleImageRef];
	CGImageRelease(grayscaleImageRef);
    
	return grayscaleImage;
}

// by http://www.sixtemia.com/journal/2010/06/23/uiimage-negative-color-effect/
- (UIImage *)negative {
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    [self drawInRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height)];
    
    CGContextSetBlendMode(context, kCGBlendModeDifference);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGContextFillRect(context, CGRectMake(0.0, 0.0, self.size.width, self.size.height));
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}


@end
