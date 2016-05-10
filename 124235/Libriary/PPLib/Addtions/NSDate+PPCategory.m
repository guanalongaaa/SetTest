//
//  NSDate+PPCategory.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-13.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "NSDate+PPCategory.h"

@implementation NSDate (PPCategory)

#pragma mark - Date components

- (NSDateComponents *)dateComponents {
    NSCalendarUnit calendarUnit = 
    NSEraCalendarUnit | 
    NSYearCalendarUnit | 
    NSMonthCalendarUnit | 
    NSDayCalendarUnit |  
    NSHourCalendarUnit | 
    NSMinuteCalendarUnit | 
    NSSecondCalendarUnit | 
    NSWeekCalendarUnit | 
    NSWeekdayCalendarUnit | 
    NSWeekdayOrdinalCalendarUnit | 
    NSQuarterCalendarUnit | 
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_5_0
    NSWeekOfMonthCalendarUnit | 
    NSWeekOfYearCalendarUnit | 
    NSYearForWeekOfYearCalendarUnit | 
#endif
    NSCalendarCalendarUnit | 
    NSTimeZoneCalendarUnit;
    return [[NSCalendar currentCalendar] components:calendarUnit fromDate:self];
}


#pragma mark - Comparing

- (BOOL)isEarlierThanDate:(NSDate *)dt {
	return ([self earlierDate:dt] == self);
}

- (BOOL)isLaterThanDate:(NSDate *)dt {
	return ([self laterDate:dt] == self);
}


- (BOOL)isSameYearAsDate:(NSDate *)dt {
    NSDateComponents *components1 = [self dateComponents];
    NSDateComponents *components2 = [dt dateComponents];
	return ([components1 year] == [components2 year]);
}

- (BOOL)isSameMonthAsDate:(NSDate *)dt {
    NSDateComponents *components1 = [self dateComponents];
    NSDateComponents *components2 = [dt dateComponents];
	return (([components1 year] == [components2 year]) &&
			([components1 month] == [components2 month]));
}

- (BOOL)isSameDayAsDate:(NSDate *)dt {
    NSDateComponents *components1 = [self dateComponents];
    NSDateComponents *components2 = [dt dateComponents];
	return (([components1 year] == [components2 year]) &&
			([components1 month] == [components2 month]) && 
			([components1 day] == [components2 day]));
}

- (BOOL)isToday
{
    return [self isSameDayAsDate:[NSDate date]];
}


+ (id)dateWithISO8601Date:(NSString *)inDateString
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	
    NSArray *formatsToTry = [NSArray arrayWithObjects:@"yyyy-MM-dd'T'HH:mm:ssZ",
                             @"yyyy-MM-dd'T'HH:mm:ss'Z'",
                             @"yyyy-MM-dd",
                             @"yyyy'-'MM'-'dd'T'HH':'mm':'ssz':'00",
							 @"yyyy-MM-dd HH:mm:ss",
							 // this is a hack for '2011-04-13T12:00:00+0700' supposedly this is incorrect, but kinda works.
                             nil];
    
    NSDate *ret = [NSDate date];
    
    for(NSString *format in formatsToTry)
    {
        [dateFormatter setDateFormat:format];
        ret = [dateFormatter dateFromString:inDateString];
        if(ret)
            break;
    }
    
    if (ret == nil) {
        ret = [NSDate dateWithTimeIntervalSince1970:[inDateString integerValue]];
    }
    return ret;
}


+ (id)dateWithYYYYMMDD:(NSString *)inDateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    return [formatter dateFromString:inDateString];
}

+ (id)dateWithYYYYMMDDhhmmss:(NSString *)inDateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"yyyyMMddHHmmssSSSS"];
	return [formatter dateFromString:inDateString];
}

- (NSString *)toISO8601
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init] ;
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)toYYYYMMDD
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    return [formatter stringFromDate:self];
}

- (NSString *)toYYYYMMDDhhmmss
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
	[formatter setDateFormat:@"yyyyMMddHHmmssSSSS"];
	return [formatter stringFromDate:self];
}

@end
