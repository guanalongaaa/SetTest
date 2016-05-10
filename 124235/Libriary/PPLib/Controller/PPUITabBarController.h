//
//  PPUITabBarController.h
//  PPLibTest
//
//  Created by 王鹏 on 13-1-18.
//  Copyright (c) 2013年 pengjay.cn@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTabBar.h"
@interface PPUITabBarController : UITabBarController<PPTabBarDelegate>
{
	
}
@property (nonatomic, retain) PPTabBar *mTabBar;
@property (nonatomic, retain) NSArray *mImageArray;
- (id)initWithViewControllers:(NSArray *)ctrls tabImageArray:(NSArray *)imgArr tabTitleArray:(NSArray *)titleArr;
- (id)initWithViewControllers:(NSArray *)ctrls tabImageArray:(NSArray *)imgArr tabTitleArray:(NSArray *)titleArr tabBackgroundImage:(UIImage *)backgroundImage;

- (void)refreshTabBarTitles:(NSArray *)titleArray;
    
@end
