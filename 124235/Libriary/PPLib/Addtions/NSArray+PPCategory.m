//
//  NSArray+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "NSArray+PPCategory.h"
#import "NSMutableArray+PPCategory.h"

@implementation NSArray (PPCategory)
#pragma mark - Querying

- (id)objectOrNilAtIndex:(NSUInteger)i {
    if (i < [self count]) {
        return [self objectAtIndex:i];
    }
    return nil;
}

- (id)firstObject {
    return [self objectOrNilAtIndex:0];
}

- (id)randomObject {
    if ([self count] > 0) {
        int i = arc4random() % [self count];
        return [self objectAtIndex:i];
    }
    return nil;
}



#pragma mark - Ordering and filtering

- (NSArray *)shuffledArray {
    NSMutableArray *tmp = [NSMutableArray arrayWithArray:self];
    [tmp shuffle];
    return [NSArray arrayWithArray:tmp];
}

- (NSArray *)reversedArray {
    NSMutableArray *tmp = [NSMutableArray arrayWithArray:self];
    [tmp reverse];
    return [NSArray arrayWithArray:tmp];
}

- (NSArray *)uniqueArray {
    NSMutableArray *tmp = [NSMutableArray arrayWithArray:self];
    [tmp unique];
    return [NSArray arrayWithArray:tmp];
}

@end
