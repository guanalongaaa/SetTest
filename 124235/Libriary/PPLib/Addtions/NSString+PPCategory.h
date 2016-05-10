//
//  NSString+PPCategory.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PPCategory)

//create NSString
+ (NSString *)stringWithUTF8Data:(NSData *)data;
+ (NSString *)stringWithData:(NSData *)data encoding:(NSStringEncoding)encoding;
+ (NSString *)stringWithBase64String:(NSString *)base64String;
+ (NSString *)stringWithUUID;
+ (NSString *)randStringWithLength:(NSUInteger)length;
+ (NSString *)randAlphanumericStringWithLength:(NSUInteger)length;


//hash
- (NSString *)md5Hash;
- (NSString *)sha1Hash;

//check Valid
- (BOOL)isEmailAddress;
- (BOOL)isLetters;
- (BOOL)isNumbers;
- (BOOL)isNumberOrLetters;
//base64
- (NSString *)base64EncodedString;

//URL
- (NSURL *)URL;

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

- (NSString *)stringByAddingQueryDictionary:(NSDictionary *)dictionary;
- (NSString *)stringByAppendingParameter:(id)paramter forKey:(NSString *)key;

/*
 * Drawing metrics
 */
- (CGFloat)widthWithFont:(UIFont *)font;
- (CGFloat)widthWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGFloat)widthWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode;

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode;

/*
 * Finding
 */
- (BOOL)containsString:(NSString *)string; // Case insensitive
- (BOOL)containsString:(NSString *)string ignoringCase:(BOOL)ignore;

/*
 * Comparing
 */
- (BOOL)equalsToString:(NSString *)string; // Case insensitive
- (BOOL)equalsToString:(NSString *)string ignoringCase:(BOOL)ignore;

/*
 * Replacing
 */
- (NSString *)stringByReplacingString:(NSString *)searchString withString:(NSString *)newString; // Case sensitive
- (NSString *)stringByReplacingString:(NSString *)searchString withString:(NSString *)newString ignoringCase:(BOOL)ignore;

/*
 * Triming
 */
- (NSString *)stringByRemovingWhitespace;
- (NSString *)stringByRemovingWhitespaceAndNewline;

/*
 * replace ' with ''
 */
- (NSString *)stringbySqlFormat;

@end
