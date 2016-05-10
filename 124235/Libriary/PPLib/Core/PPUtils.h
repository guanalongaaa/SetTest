//
//  PPUtils.h
//  PPLibTest
//
//  Created by Paul Wang on 12-7-21.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPUtils : NSObject

+(NSString *)bundlePath:(NSString *)fileName;
+(NSString *)documentsPath:(NSString *)fileName;
+ (NSString *)cacheDictoryPath;
+ (NSUInteger)ppGetFileSize:(NSString *)path;
+ (void)ppCreateDirectory:(NSString *)path;
@end
