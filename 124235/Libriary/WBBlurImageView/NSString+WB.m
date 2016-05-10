//
//  NSString+WB.m
//
//  Created by mac on 14-5-10.
//  Copyright (c) 2014年 Weibai Lu. All rights reserved.
//

#import "NSString+WB.h"

@implementation NSString (WB)

- (CGSize)sizeOfStringWithSize:(CGSize)size andFont:(UIFont *)font
{
    return iOS7? [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size : [self sizeWithFont:font constrainedToSize:size];
}

@end
