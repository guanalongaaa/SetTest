//
//  NSString+WB.h
//
//  Created by mac on 14-5-10.
//  Copyright (c) 2014年 Weibai Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WB)

/**
 *  计算并返回一行文字的大小
 *
 *  @param size 限定的大小
 *  @param font 字体
 */
- (CGSize)sizeOfStringWithSize: (CGSize)size andFont: (UIFont *)font;

@end
