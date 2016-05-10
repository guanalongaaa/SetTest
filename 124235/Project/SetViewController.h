//
//  SetViewController.h
//  124235
//
//  Created by guanalong on 16/4/27.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "GALGroupTableViewController.h"

@interface SetViewController : GALGroupTableViewController<UINavigationControllerDelegate>



-(NSDictionary *)cellInfoWithTitle:(NSString *)title detail:(id)detail;
//-(NSDictionary *)userInfoArray;


@end
