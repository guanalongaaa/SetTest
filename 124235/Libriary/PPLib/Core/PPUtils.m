//
//  PPUtils.m
//  PPLibTest
//
//  Created by Paul Wang on 12-7-21.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "PPUtils.h"

@implementation PPUtils

+(NSString *)bundlePath:(NSString *)fileName {
	return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
}

+(NSString *)documentsPath:(NSString *)fileName {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:fileName];
}

+ (NSString *)cacheDictoryPath
{
    NSString *filePath = [NSString stringWithFormat:@"%@/Library/Caches", NSHomeDirectory()];
    return filePath;
}

+ (NSUInteger)ppGetFileSize:(NSString *)path
{
    NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    NSUInteger psize = [[dic objectForKey:@"NSFileSize"] integerValue];
    return psize;
}

+ (void)ppCreateDirectory:(NSString *)path
{
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}

@end
