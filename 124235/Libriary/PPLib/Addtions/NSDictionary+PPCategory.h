//
//  NSDictionary+PPCategory.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (PPCategory)

- (BOOL)hasObjectForKey:(id)key;

//URL
- (NSString *)queryString;
@end
