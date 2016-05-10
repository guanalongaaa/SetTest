//
//  NSDate+PPCategory.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-13.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PPCategory)
+ (id)dateWithISO8601Date:(NSString *)inDateString;
+ (id)dateWithYYYYMMDD:(NSString *)inDateString;
+ (id)dateWithYYYYMMDDhhmmss:(NSString *)inDateString;

- (NSString *)toISO8601;
- (NSString *)toYYYYMMDD;
- (NSString *)toYYYYMMDDhhmmss;

- (NSDateComponents *)dateComponents;

/*
 * Comparing
 */
- (BOOL)isEarlierThanDate:(NSDate *)dt;
- (BOOL)isLaterThanDate:(NSDate *)dt;

- (BOOL)isSameYearAsDate:(NSDate *)dt;
- (BOOL)isSameMonthAsDate:(NSDate *)dt;
- (BOOL)isSameDayAsDate:(NSDate *)dt;

- (BOOL)isToday;
@end
