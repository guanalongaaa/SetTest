//
//  NSMutableString+PPCategory.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (PPCategory)


//URL
- (void)addQueryDictionary:(NSDictionary *)dictionary;
- (void)appendParameter:(id)paramter forKey:(NSString *)key;

//
- (void)replaceString:(NSString *)searchString withString:(NSString *)newString; // Case sensitive
- (void)replaceString:(NSString *)searchString withString:(NSString *)newString ignoringCase:(BOOL)ignore;

/*
 * Triming
 */
- (void)removeWhitespace;
- (void)removeWhitespaceAndNewline;

@end
