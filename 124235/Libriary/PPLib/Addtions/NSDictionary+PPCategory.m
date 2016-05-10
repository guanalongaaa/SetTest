//
//  NSDictionary+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "NSDictionary+PPCategory.h"
#import "NSString+PPCategory.h"

@implementation NSDictionary (PPCategory)

- (BOOL)hasObjectForKey:(id)key
{
	return [[self allKeys] containsObject:key];
}


#pragma mark - URL
- (NSString *)queryString {
    NSMutableArray *parameters = [NSMutableArray array];
    
    NSEnumerator *enumerator = [self keyEnumerator];
    NSString *key = nil;
    while ((key = [enumerator nextObject])) {
        NSString *parameter = [self objectForKey:key];
        [parameters addObject:[NSString stringWithFormat:@"%@=%@", [key URLEncodedString] , [parameter URLEncodedString]]];
    }
    
    return [parameters componentsJoinedByString:@"&"];
}

@end
