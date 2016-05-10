//
//  GALButtonItem.m
//  124235
//
//  Created by guanalong on 16/4/26.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "GALButtonItem.h"

@implementation GALButtonItem
@synthesize label;
@synthesize action;


+(id)item
{
    return [self new];
}

+(id)itemWithLabel:(NSString *)inLabel
{
    GALButtonItem *newItem = [self item];
    [newItem setLabel:inLabel];
    return newItem;
}


@end
