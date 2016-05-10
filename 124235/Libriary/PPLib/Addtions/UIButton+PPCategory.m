//
//  UIButton+PPCategory.m
//  PPLib
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "UIButton+PPCategory.h"

@implementation UIButton (PPCategory)
- (void)centerButtonAndImageWithSpacing:(CGFloat)spacing {
    // Get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // Lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    
    // The text width might have changed (in case it was shortened before due to lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // Raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0 - (titleSize.height + spacing), 0.0, 0.0, 0.0 - titleSize.width);
}

- (void)exchangeImageAndTitleWithSpacing:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width-spacing, 0.0, 0.0);

    titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0+titleSize.width+imageSize.width, 0.0, 0.0);
}

- (void)centerMyTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // Lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, 0.0);
    
    // The text width might have changed (in case it was shortened before due to lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // Raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0 ,- imageSize.width-spacing, 0.0, 0.0 );

}

- (void)normalMyTitle
{
//    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // Lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    
    // The text width might have changed (in case it was shortened before due to lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // Raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0 ,0.0, 0.0, 0.0 );
}


+ (id) buttonWithFrame:(CGRect)frame
{
	return [UIButton buttonWithFrame:frame title:nil];
}

+ (id) buttonWithFrame:(CGRect)frame title:(NSString*)title
{
	return [UIButton buttonWithFrame:frame title:title backgroundImage:nil];
}


+ (id) buttonWithFrame:(CGRect)frame title:(NSString*)title backgroundImage:(UIImage*)backgroundImage
{
	return [UIButton buttonWithFrame:frame title:title backgroundImage:backgroundImage highlightedBackgroundImage:nil];
}

+ (id) buttonWithFrame:(CGRect)frame title:(NSString*)title backgroundImage:(UIImage*)backgroundImage highlightedBackgroundImage:(UIImage*)highlightedBackgroundImage
{
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.frame = frame;
	[btn setTitle:title forState:UIControlStateNormal];
	[btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
	[btn setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
	return btn;
}

+ (id) buttonWithFrame:(CGRect)frame image:(UIImage*)image
{
	return [UIButton buttonWithFrame:frame image:image highlightedImage:nil];
}

+ (id) buttonWithFrame:(CGRect)frame image:(UIImage*)image highlightedImage:(UIImage*)highlightedImage
{
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	btn.frame = frame;
	[btn setImage:image forState:UIControlStateNormal];
	[btn setImage:image forState:UIControlStateHighlighted];
	return btn;
}
@end
