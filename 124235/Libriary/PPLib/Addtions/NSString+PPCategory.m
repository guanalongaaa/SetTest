//
//  NSString+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-12.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "NSString+PPCategory.h"
#import "PPCore.h"
#import "NSData+PPCategory.h"
#import "NSMutableString+PPCategory.h"

@implementation NSString (PPCategory)
#pragma mark - Creating

+ (NSString *)stringWithUTF8Data:(NSData *)data {
    return [self stringWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSString *)stringWithData:(NSData *)data encoding:(NSStringEncoding)encoding {
    return [[[NSString alloc] initWithData:data encoding:encoding] autorelease];
}

+ (NSString *)stringWithBase64String:(NSString *)base64String {
    NSData *data = [NSData dataWithBase64EncodedString:base64String];
    return [NSString stringWithUTF8Data:data];
}

+ (NSString *)stringWithUUID {
	CFUUIDRef UUIDObject = CFUUIDCreate(NULL);
	NSString *UUIDString = (NSString *)CFUUIDCreateString(nil, UUIDObject);
    CFRelease(UUIDObject);
	return [UUIDString autorelease];
}

+ (NSString *)randStringWithLength:(NSUInteger)length {
    if (length<=0) return @"";
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger i=0U; i<length; i++) {
        [string appendFormat:@"%c", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    return [NSString stringWithString:string];
}

+ (NSString *)randAlphanumericStringWithLength:(NSUInteger)length {
    if (length<=0) return @"";
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY";
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger i=0U; i<length; i++) {
        [string appendFormat:@"%c", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    return [NSString stringWithString:string];
}


#pragma mark - Hash

- (NSString *)md5Hash {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data md5Hash];
}

- (NSString *)sha1Hash {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data sha1Hash];
}

#pragma mark - Check Valid

- (BOOL)isEmailAddress {
	if([self length] <= 0)
		return NO;
    NSString *regularExpression = 
	@"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"  
	@"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" 
	@"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"  
	@"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"  
	@"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"  
	@"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"  
	@"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";  
	
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularExpression];  
    return [predicate evaluateWithObject:[self lowercaseString]];  
}

- (BOOL)isLetters{
	if([self length] <= 0)
		return NO;
    NSString *regex = @"[a-zA-Z]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isNumbers{
	if([self length] <= 0)
		return NO;
    NSString *regex = @"[0-9]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isNumberOrLetters{
	if([self length] <= 0)
		return NO;
    NSString *regex = @"[a-zA-Z0-9]*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

#pragma mark - Base64

- (NSString *)base64EncodedString {
    if ([self length] > 0) {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        return [data base64Encoding];
    }
    return nil;
}



#pragma mark - URL

- (NSURL *)URL {
    return [NSURL URLWithString:self];
}

- (NSString *)URLEncodedString {
    NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR("!*'();:@&=+$,/?%#[]<>"), kCFStringEncodingUTF8);
    return [result autorelease];
}

- (NSString *)URLDecodedString {
    NSString *result = (NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8);
    return [result autorelease];
}

- (NSString *)stringByAddingQueryDictionary:(NSDictionary *)dictionary {
    NSMutableString *tmp = [NSMutableString stringWithString:self];
    [tmp addQueryDictionary:dictionary];
    return [NSString stringWithString:tmp];
}

- (NSString *)stringByAppendingParameter:(id)paramter forKey:(NSString *)key {
    NSMutableString *tmp = [NSMutableString stringWithString:self];
    [tmp appendParameter:paramter forKey:key];
    return [NSString stringWithString:tmp];
}

#pragma mark - Drawing metrics

- (CGFloat)widthWithFont:(UIFont *)font {
    CGSize size = [self sizeWithFont:font];
    return size.width;
}

- (CGFloat)widthWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width {
    return [self widthWithFont:font constrainedToWidth:width lineBreakMode:UILineBreakModeWordWrap];
}

- (CGFloat)widthWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode {
    CGSize size = [self sizeWithFont:font forWidth:width lineBreakMode:lineBreakMode];
    return size.width;
}


- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width {
    return [self heightWithFont:font constrainedToWidth:width lineBreakMode:UILineBreakModeWordWrap];
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode {
    CGSize size = [self sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:lineBreakMode];
    return size.height;
}

#pragma mark - Finding

- (BOOL)containsString:(NSString *)string {
    return [self containsString:string ignoringCase:YES];
}


- (BOOL)containsString:(NSString *)string ignoringCase:(BOOL)ignore {
    NSStringCompareOptions options = NSLiteralSearch;
    if (ignore)
        options = NSCaseInsensitiveSearch;
    
    NSRange range = [self rangeOfString:string options:options];
	return (range.location != NSNotFound);
}



#pragma mark - Comparing

- (BOOL)equalsToString:(NSString *)string 
{
    return [self equalsToString:string ignoringCase:YES];
}

- (BOOL)equalsToString:(NSString *)string ignoringCase:(BOOL)ignore 
{
    NSStringCompareOptions options = NSLiteralSearch;
    if (ignore)
        options = NSCaseInsensitiveSearch;
    
    return (NSOrderedSame == [self compare:string options:options]);
}



#pragma mark - Replacing

- (NSString *)stringByReplacingString:(NSString *)searchString withString:(NSString *)newString
{
    return [self stringByReplacingString:searchString withString:newString ignoringCase:NO];
}

- (NSString *)stringByReplacingString:(NSString *)searchString withString:(NSString *)newString ignoringCase:(BOOL)ignore
{
    NSMutableString *tmp = [NSMutableString stringWithString:self];
    [tmp replaceString:searchString withString:newString ignoringCase:ignore];
    return [NSString stringWithString:tmp];
}



#pragma mark - Triming

- (NSString *)stringByRemovingWhitespace 
{
    NSMutableString *tmp = [NSMutableString stringWithString:self];
    [tmp removeWhitespace];
    return [NSString stringWithString:tmp];
}

- (NSString *)stringByRemovingWhitespaceAndNewline {
    NSMutableString *tmp = [NSMutableString stringWithString:self];
    [tmp removeWhitespaceAndNewline];
    return [NSString stringWithString:tmp];
}

- (NSString *)stringbySqlFormat {
    return [self stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
}

@end
