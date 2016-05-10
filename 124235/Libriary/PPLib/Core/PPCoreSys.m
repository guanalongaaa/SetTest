//
//  PPCoreSys.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-13.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "PPCoreSys.h"
#include <sys/xattr.h>

#pragma mark - Software platform

CGFloat PPIOSVersion(void) {
    return [[[[UIDevice class] currentDevice] systemVersion] floatValue];
}

NSString *PPCurrentVersion(void)
{
    NSString* appver = [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    return appver;
}



BOOL PPaddSkipBackupAttributeToItemAtPath(NSString * path)
{
		assert([[NSFileManager defaultManager] fileExistsAtPath:path]);
		NSURL *URL = [NSURL fileURLWithPath:path];
		NSError *error = nil;
	    BOOL result = [URL setResourceValue: [NSNumber numberWithBool: YES]
								forKey: NSURLIsExcludedFromBackupKey error: &error];
		if(!result){
			NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
		}
    return result;
}