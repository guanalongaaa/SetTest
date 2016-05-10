//
//  PPCoreSys.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-13.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Software platform

CGFloat PPIOSVersion(void);
NSString *PPCurrentVersion(void);
BOOL PPaddSkipBackupAttributeToItemAtPath(NSString * path);