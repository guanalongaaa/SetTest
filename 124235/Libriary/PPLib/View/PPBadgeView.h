//
//  PPBadgeView.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-18.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPBadgeView : UIView

@property (nonatomic, assign) BOOL shadowEnabled;
@property (nonatomic, retain) UIColor *badgeColor;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, copy) NSString *badgeString;
@end
