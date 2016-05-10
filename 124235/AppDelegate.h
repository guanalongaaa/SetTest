//
//  AppDelegate.h
//  124235
//
//  Created by smartdot on 16/4/19.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import <UIKit/UIKit.h>

//string文件啊
#define LOCALIZEDSTRING(string) NSLocalizedStringFromTableInBundle(string, @"Localizable", del.localizedStringBundle, nil)

#define LANGUAGE_ENGLISH @"en"
#define LANGUAGE_CHINESE_SIMPLIFIED @"zh-Hans"
#define LANGUAGE_CHINESE_TRADITIONAL @"zh-Hant"

//多语言设置
#define LANGUAGE_NONE_DISPLAY_NAME @"跟随系统"
#define LANGUAGE_ENGLISH_DISPLAY_NAME @"English"
#define LANGUAGE_CHINESE_SIMPLIFIED_DISPLAY_NAME @"简体中文"
#define LANGUAGE_CHINESE_TRADITIONAL_DISPLAY_NAME @"繁體中文"

#define IMScreenHeight  [[UIScreen mainScreen] bounds].size.height
#define IMScreenWidth  [[UIScreen mainScreen] bounds].size.width

static NSString *const kGOCOMLanguageChangedNote = @"kGOCOMLanguageChangedNote";

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic ,assign) NSInteger chatFontNum;
@property (nonatomic, retain) NSBundle *localizedStringBundle;


//设置语言
- (NSString*)languageFromUserDefaults;

- (NSString*)languageDisplayNameFromUserDefaults;

- (void)setLanguageForUserDefaultsWithLanguageName:(NSString*)languageName;

@end
extern AppDelegate *del;
