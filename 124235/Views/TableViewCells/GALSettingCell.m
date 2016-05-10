//
//  GALSettingCell.m
//  124235
//
//  Created by guanalong on 16/5/5.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "GALSettingCell.h"
#import "PPCore.h"
#import "UIView+PPCategory.h"
#import <QuartzCore/QuartzCore.h>
#import "PPBadgeView.h"

#define IMAGE_LENGTH 30
#define DETAIL_LABEL_HEIGHT 28.0
#define DETAIL_LABEL_WIDTH 200.0
#define ACCESSORY_DISCLOSURE_WIDTH 26.0

#define IMScreenHeight  [[UIScreen mainScreen] bounds].size.height
#define IMScreenWidth  [[UIScreen mainScreen] bounds].size.width

@interface GALSettingCell ()
@property (nonatomic, retain) UIImageView *detailImageView;
@property (nonatomic, retain) UILabel *detailLabel;

@end


@implementation GALSettingCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.font = [UIFont systemFontOfSize:15.0];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        self.backgroundColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.stateView = [[UIImageView alloc] initWithFrame:CGRectMake(112, (self.frame.size.height - 8) / 2, 8, 8)];
        self.stateView.image = [UIImage imageNamed:@"icon_redpoint"];
        [self.contentView addSubview:self.stateView];
        self.stateView.hidden = YES;
        
        self.badgeView = [[PPBadgeView alloc] initWithFrame:CGRectMake(110, (self.frame.size.height - 12) / 2 - 6, 12, 12)];
        self.badgeView.badgeColor = [UIColor redColor];
        [self.contentView addSubview:self.badgeView];
        self.badgeView.hidden = YES;
        self.showSwitch = [[UISwitch alloc] init];
        
    }
    
    return self;
}

- (void)removeDetailLabelView
{
    if (self.detailLabel) {
        [self.detailLabel removeFromSuperview];
        self.detailLabel = nil;
    }
}

- (void)removeDetailImageView
{
    if (self.detailImageView) {
        [self.detailImageView removeFromSuperview];
        self.detailImageView = nil;
    }
}

- (void)removeDetailViews
{
    [self removeDetailLabelView];
    [self removeDetailImageView];
}

- (void)setDetail:(id)detail
{
    if ([detail isKindOfClass:[NSString class]]) {
        [self removeDetailImageView];
        if (self.detailLabel == nil) {
            self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(IMScreenWidth - ACCESSORY_DISCLOSURE_WIDTH - DETAIL_LABEL_WIDTH - 6, 6.0, DETAIL_LABEL_WIDTH, DETAIL_LABEL_HEIGHT)];
            self.detailLabel.textColor = [UIColor grayColor];
            self.detailLabel.font = [UIFont systemFontOfSize:13.5];
            self.detailLabel.backgroundColor = [UIColor clearColor];
            self.detailLabel.textAlignment = NSTextAlignmentRight;
            [self.contentView addSubview:self.detailLabel];
            
        }
        
        self.detailLabel.text = detail;
    }
    else if ([detail isKindOfClass:[UIImage class]]) {
        [self removeDetailLabelView];
        if (self.detailImageView == nil) {
            self.detailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(IMScreenWidth - IMAGE_LENGTH - ACCESSORY_DISCLOSURE_WIDTH - 6, 7.0, IMAGE_LENGTH, IMAGE_LENGTH)];
            //self.detailImageView.layer.cornerRadius = 3.0f;
            self.detailImageView.layer.masksToBounds = YES;
            [self.contentView addSubview:self.detailImageView];
        }
        self.detailImageView.image = detail;
    }
    else if (detail == nil) {
        [self removeDetailViews];
    }
    
    if (_detail)
        _detail = detail;
}

- (void)setTitle:(NSString *)title
{
    self.textLabel.text = title;
    
    if (_title)
        _title = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    if (selected) {
        self.textLabel.textColor = [UIColor whiteColor];
        self.detailLabel.textColor = [UIColor lightGrayColor];
    }
    else {
        self.textLabel.textColor = [UIColor blackColor];
        self.detailLabel.textColor = [UIColor grayColor];
    }
}


@end
