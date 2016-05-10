//
//  PPCoreMisc.m
//  PPLibTest
//
//  Created by Paul Wang on 12-6-14.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import "PPCoreMisc.h"

#pragma mark - Comparing number

//1.987654321 == 1.987654322
// 1.98765431 != 1.98765432
BOOL PPIsFloatEqualToFloat(CGFloat fa, CGFloat fb) {
    return (fabs(fa - fb) < (1.0E-8));
}

BOOL PPIsBoolEqualToBool(BOOL ba, BOOL bb) {
    return ( (ba && bb) || (!ba && !bb) );
}
