//
//  ProjectLanguage.h
//  124235
//
//  Created by guanalong on 16/5/9.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOCALIZEDSTRING(string) NSLocalizedStringFromTableInBundle(string, @"Localizable", del.localizedStringBundle, nil)

#define LANGUAGE_ENGLISH @"en"
#define LANGUAGE_CHINESE_SIMPLIFIED @"zh-Hans"
#define LANGUAGE_CHINESE_TRADITIONAL @"zh-Hant"

#define LANGUAGE_NONE_DISPLAY_NAME LOCALIZEDSTRING(@"跟随系统")
#define LANGUAGE_ENGLISH_DISPLAY_NAME @"English"
#define LANGUAGE_CHINESE_SIMPLIFIED_DISPLAY_NAME @"简体中文"
#define LANGUAGE_CHINESE_TRADITIONAL_DISPLAY_NAME @"繁體中文"

@interface ProjectLanguage : NSObject


@end
