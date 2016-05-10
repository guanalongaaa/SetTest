//
//  NSArray+PPCategory.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (PPCategory)
/*
 * Querying
 */
- (id)objectOrNilAtIndex:(NSUInteger)i;
- (id)firstObject;
- (id)randomObject;

/*
 * Ordering and filtering
 */
- (NSArray *)shuffledArray;
- (NSArray *)reversedArray;
- (NSArray *)uniqueArray;

@end
