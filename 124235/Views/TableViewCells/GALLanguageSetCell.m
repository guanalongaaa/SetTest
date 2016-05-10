//
//  GALLanguageSetCell.m
//  124235
//
//  Created by guanalong on 16/5/9.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "GALLanguageSetCell.h"

#define OFFSET_X 4.0
#define OFFSET_Y 6.0

@interface GALLanguageSetCell()

@property (nonatomic, retain) UIButton *checkButton;

@end

@implementation GALLanguageSetCell

- (void)dealloc {
    self.checkButton = nil;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self= [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.checkButton setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
        self.checkButton.frame = CGRectMake(0, 0, 20, 20);
        self.accessoryView = self.checkButton;
        self.textLabel.font = [UIFont systemFontOfSize:14.0];
        self.checkButton.userInteractionEnabled = NO;
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }
    return self;
}

- (void)setCellChecked:(BOOL)checked {
    if (checked) {
        [self.checkButton setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
    } else {
        [self.checkButton setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    //05.09
     [self setCellChecked:selected];
}

@end
