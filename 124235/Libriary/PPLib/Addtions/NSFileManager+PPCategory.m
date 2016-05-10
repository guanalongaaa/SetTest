//
//  NSFileManager+PPCategory.m
//  PPLibTest
//
//  Created by 王鹏 on 13-1-7.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import "NSFileManager+PPCategory.h"
#import "NSArray+PPCategory.h"
@implementation NSFileManager (PPCategory)
-(NSString *)cacheDirectoryPath
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

-(NSString *)documentsDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

- (void)createDirectoryIfNeeded:(NSString *)dirPath
{
    if (![self fileExistsAtPath:dirPath]) {
        NSError *cErr = nil;
        [self createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&cErr];
    }
}
@end
