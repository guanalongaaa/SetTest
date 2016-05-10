//
//  GALSettingCell.h
//  124235
//
//  Created by guanalong on 16/5/5.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PPBadgeView;


@interface GALSettingCell : UITableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) id detail;
@property (nonatomic, strong) UIImageView *stateView;
@property (nonatomic, strong) PPBadgeView *badgeView;
@property (nonatomic, strong) UISwitch *showSwitch;

@end
