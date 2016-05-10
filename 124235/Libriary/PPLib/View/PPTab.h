//
//  PPTab.h
//  PPLibTest
//
//  Created by Paul Wang on 12-6-18.
//  Copyright (c) 2012年 pengjay.cn@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPBadgeView.h"

@interface PPTab : UIButton
{
    PPBadgeView *_badge;

}

- (void)updateBadege:(int)badgeNumber;
@end
