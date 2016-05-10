//
//  NSMutableString+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "NSMutableString+PPCategory.h"
#import "NSString+PPCategory.h"
@implementation NSMutableString (PPCategory)

#pragma mark - URL

- (void)addQueryDictionary:(NSDictionary *)dictionary {
    NSEnumerator *keyEnumerator = [dictionary keyEnumerator];
    NSString *key = nil;
    while ((key = [keyEnumerator nextObject])) {
        NSString *value = [dictionary objectForKey:key];
        [self appendParameter:value forKey:key];
    }
}

- (void)appendParameter:(id)paramter forKey:(NSString *)key {
    if (paramter) {
        BOOL needsQuestionMark = [self rangeOfString:@"?" options:0].location == NSNotFound;
        if (needsQuestionMark) {
            [self appendString:@"?"];
        }
        
        BOOL charOnEnd = [self hasSuffix:@"&"] || [self hasSuffix:@"?"];
        if (!charOnEnd) {
            [self appendString:@"&"];
        }
        
        [self appendFormat:@"%@=%@", [key URLEncodedString] , [paramter URLEncodedString]];
    }
}



#pragma mark - Replacing

- (void)replaceString:(NSString *)searchString withString:(NSString *)newString {
    [self replaceString:searchString withString:newString ignoringCase:NO];
}
- (void)replaceString:(NSString *)searchString withString:(NSString *)newString ignoringCase:(BOOL)ignore {
    NSStringCompareOptions options = NSLiteralSearch;
    if (ignore)
        options = NSCaseInsensitiveSearch;
    
    [self replaceOccurrencesOfString:searchString withString:newString options:options range:NSMakeRange(0, [self length])];
}



#pragma mark - Triming

- (void)removeWhitespace {
    NSString *replaced = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    [self replaceCharactersInRange:NSMakeRange(0, [self length]) withString:replaced];
}

- (void)removeWhitespaceAndNewline {
    NSString *replaced = [[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""];
    [self replaceCharactersInRange:NSMakeRange(0, [self length]) withString:replaced];
}

@end
