//
//  NSMutableArray+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "NSMutableArray+PPCategory.h"

@implementation NSMutableArray (PPCategory)

#pragma mark - Adding and removing entries

- (id)addObjectIfNotNil:(id)object {
    if (object) {
        [self addObject:object];
        return object;
    }
    return nil;
}

- (id)addNonEqualObjectIfNotNil:(id)object {
    if (object) {
        if ([self indexOfObject:object] == NSNotFound) {
            [self addObject:object];
            return object;
        }
    }
    return nil;
}

- (id)addNonIdenticalObjectIfNotNil:(id)object {
    if (object) {
        if ([self indexOfObjectIdenticalTo:object] == NSNotFound) {
            [self addObject:object];
            return object;
        }
    }
    return nil;
}

- (id)insertObject:(id)object atIndexIfNotNil:(NSUInteger)index {
    if (object && index <= [self count]) {
        [self insertObject:object atIndex:index];
        return object;
    }
    return nil;
}

- (id)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
	if (index == toIndex)
		return nil;
    
    if (index < [self count] && toIndex < [self count]) {
        id object = [self objectAtIndex:index];
//        [object retain];
        [self removeObjectAtIndex:index];
        [self insertObject:object atIndex:toIndex];
//        return [object autorelease];
    }
    return nil;
}

- (void)removeFirstObject {
    if ([self count] > 0) {
        [self removeObjectAtIndex:0];
    }
}



#pragma mark - Ordering and filtering

// http://en.wikipedia.org/wiki/Knuth_shuffle
- (void)shuffle {
    for(NSUInteger i = [self count]; i > 1; i--) {
        
        NSUInteger m = 1;
        do {
            m <<= 1;
        } while(m < i);
        
        
        NSUInteger j;
        do {
            j = arc4random() % m;
        } while(j >= i);
        
        [self exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }
}

- (void)reverse {
	for (int i=0; i<(floor([self count]/2.0)); i++) {
		[self exchangeObjectAtIndex:i withObjectAtIndex:([self count]-(i+1))];
    }
}

- (void)unique {
    NSArray *tmp = [self copy];
    [self removeAllObjects];
    for (id object in tmp) {
        [self addNonEqualObjectIfNotNil:object];
    }
//    [tmp release];
}



#pragma mark - Stack

- (id)push:(id)object {
    return [self addObjectIfNotNil:object];
}

- (id)pop {
    if ([self count] > 0) {
        id object = [self lastObject];
//        [object retain];
        [self removeLastObject];
//        return [object autorelease];
    }
    return nil;
}



#pragma mark - Queue

- (id)enqueue:(id)object {
	if (object) {
        [self insertObject:object atIndex:0];
        return object;
    }
    return nil;
}

- (id)dequeue {
    if ([self count] > 0) {
        id object = [self lastObject];
//        [object retain];
        [self removeLastObject];
//        return [object autorelease];
    }
    return nil;
}

@end
