//
//  AppDelegate.m
//  124235
//
//  Created by smartdot on 16/4/19.
//  Copyright © 2016年 smartdot. All rights reserved.
//

#import "AppDelegate.h"

//第一控制器
#import "ViewController.h"
//第四控制器
#import "SetViewController.h"

//提示
#import "MBProgressHUD.h"

//导航分类
#import "UINavigationController+PPCategory.h"
#import "MLBlackTransition.h"


AppDelegate *del;

@interface AppDelegate ()

@property (nonatomic, retain) MBProgressHUD *hud;

@end

@implementation AppDelegate


/**
 *  底部Tabbar控制器
 */
- (UITabBarController *)tabBarController
{
    if(_tabBarController == nil)
    {
        
        
        //首页控制器
        ViewController *firstVC = [[ViewController alloc]initWithNibName:nil bundle:nil];
        UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:firstVC navigationBarBackgroundImage:nil];
        [firstNav enabledMLBlackTransition:YES];
        firstNav.navigationBar.disableMLBlackTransition = YES;

        
        //设置控制器
        SetViewController *setVC = [[SetViewController alloc]initWithNibName:nil bundle:nil];
        setVC.title = @"设置";
        UINavigationController *setNav = [[UINavigationController alloc]initWithRootViewController:setVC navigationBarBackgroundImage:nil];
        [setNav enabledMLBlackTransition:YES];
        setNav.navigationBar.disableMLBlackTransition = YES;
        
        
        firstNav.tabBarItem.title = @"首页";
        firstNav.tabBarItem.image = [UIImage imageNamed:@"Unknown.png"];
        firstNav.tabBarItem.selectedImage = [UIImage imageNamed:@"Unknown-1.png"];
        
//        setVC.tabBarItem.title = @"应用中心";
//        setVC.tabBarItem.image = [UIImage imageNamed:@"yingyong_btn"];
//        setVC.tabBarItem.selectedImage = [UIImage imageNamed:@"yingyong_btn_hover.png"];
        
        setNav.tabBarItem.title = @"设置";
        setNav.tabBarItem.image = [UIImage imageNamed:@"Unknown-2.png"];
        setNav.tabBarItem.selectedImage = [UIImage imageNamed:@"Unknown-3.png"];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        [tabBarController addChildViewController:firstNav];
        [tabBarController addChildViewController:setNav];
//        [tabBarController addChildViewController:appNav];
//        //工作圈
//        //[tabBarController addChildViewController:workNav];
        
        tabBarController.tabBar.selectedImageTintColor = [UIColor colorWithRed:80/255.0 green:134/255.0 blue:192/255.0 alpha:1];
//        tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        
        tabBarController.tabBar.translucent = NO;
        
        self.tabBarController = tabBarController;
        
    }
    return _tabBarController;
}






- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //05.09
    //HOOK 系统导航返回动画
    [MLBlackTransition validatePanPackWithMLBlackTransitionGestureRecognizerType:MLBlackTransitionGestureRecognizerTypeScreenEdgePan];

    
    del = self;
    NSString *language = [self languageFromUserDefaults];
    if ([language isEqualToString:LANGUAGE_ENGLISH] || [language isEqualToString:LANGUAGE_CHINESE_SIMPLIFIED] || [language isEqualToString:LANGUAGE_CHINESE_TRADITIONAL]) {
        self.localizedStringBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]];
    } else {
        self.localizedStringBundle = [NSBundle mainBundle];
        [self setLanguageForUserDefaultsWithLanguageName:LANGUAGE_NONE_DISPLAY_NAME];
    }
    
#if !TARGET_IPHONE_SIMULATOR
    [NSThread sleepForTimeInterval:2.0];
#endif

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //设置主视图控制器
    [self.window setRootViewController:self.tabBarController];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


/**
 *  读取偏好设置中的语言
 */
- (NSString*)languageFromUserDefaults {
    //怎么不行啊
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"language"];
}
/**
 *  读取偏好设置中的多语言名 (用于视图显示)
 *
 */
- (NSString*)languageDisplayNameFromUserDefaults {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"languageName"];
}
/**
 *  多语言选择保存到偏好设置
 */
- (void)setLanguageForUserDefaultsWithLanguageName:(NSString*)languageName {
    
    [[NSUserDefaults standardUserDefaults] setObject:languageName forKey:@"languageName"];
    NSString *language;
    if ([languageName isEqualToString:LANGUAGE_CHINESE_SIMPLIFIED_DISPLAY_NAME]) {
        language = LANGUAGE_CHINESE_SIMPLIFIED;
    } else if ([languageName isEqualToString:LANGUAGE_CHINESE_TRADITIONAL_DISPLAY_NAME]) {
        language = LANGUAGE_CHINESE_TRADITIONAL;
    } else if ([languageName isEqualToString:LANGUAGE_ENGLISH_DISPLAY_NAME]) {
        language = LANGUAGE_ENGLISH;
    } else {
        language = nil;
    }
    if (language) {
        [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"language"];
        self.localizedStringBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"language"];
        self.localizedStringBundle = [NSBundle mainBundle];
        [[NSUserDefaults standardUserDefaults] setObject:@"跟随系统" forKey:@"languageName"];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}



@end
