//
//  NSMutableDictionary+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "NSMutableDictionary+PPCategory.h"

@implementation NSMutableDictionary (PPCategory)
- (void)setObject:(id)object forKeyIfNotNil:(id)key
{
    if (object && key) {
        [self setObject:object forKey:key];
    }
}
@end
