//
//  NSFileManager+PPCategory.h
//  PPLibTest
//
//  Created by 王鹏 on 13-1-7.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (PPCategory)
-(NSString *)cacheDirectoryPath;
-(NSString *)documentsDirectoryPath;

- (void)createDirectoryIfNeeded:(NSString *)dirPath;
@end
