//
//  NSMutableDictionary+PPCategory.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (PPCategory)
- (void)setObject:(id)object forKeyIfNotNil:(id)key;
@end
