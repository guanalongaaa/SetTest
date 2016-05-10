//
//  GALButtonItem.h
//  124235
//
//  Created by guanalong on 16/4/26.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GALButtonItem : NSObject
{
    NSString *label;
    void (^action)();
}

@property (retain, nonatomic) NSString *label;
@property (copy, nonatomic)void (^action)();
+(id)item;
+(id)itemWithLabel:(NSString *)inLabel;

@end
