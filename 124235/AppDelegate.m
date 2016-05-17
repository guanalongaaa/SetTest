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
//第三控制器
#import "ProtalViewController.h"
//第四控制器
#import "SetViewController.h"

//提示
#import "MBProgressHUD.h"

//导航分类
#import "UINavigationController+PPCategory.h"
#import "MLBlackTransition.h"


AppDelegate *del;

@interface AppDelegate ()<UITabBarControllerDelegate>

//05.17 新建控制器
{
    UITabBarController *tabBarControllerMain;
}

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

        //视图控制器
        ProtalViewController *ProtalVC = [[ProtalViewController alloc]initWithNibName:nil bundle:nil];
        UINavigationController *ProtalNav = [[UINavigationController alloc]initWithRootViewController:ProtalVC navigationBarBackgroundImage:nil];
        [ProtalNav enabledMLBlackTransition:YES];
        ProtalNav.navigationBar.disableMLBlackTransition = YES;
        
        //设置控制器
        SetViewController *setVC = [[SetViewController alloc]initWithNibName:nil bundle:nil];
        setVC.title = @"设置";
        UINavigationController *setNav = [[UINavigationController alloc]initWithRootViewController:setVC navigationBarBackgroundImage:nil];
        [setNav enabledMLBlackTransition:YES];
        setNav.navigationBar.disableMLBlackTransition = YES;
        
        
        firstNav.tabBarItem.title = @"首页";
        firstNav.tabBarItem.image = [UIImage imageNamed:@"Unknown.png"];
        firstNav.tabBarItem.selectedImage = [UIImage imageNamed:@"Unknown-1.png"];
        
        ProtalNav.tabBarItem.title = @"视图";
        ProtalNav.tabBarItem.image = [UIImage imageNamed:@"Unknown.png"];
        ProtalNav.tabBarItem.selectedImage = [UIImage imageNamed:@"Unknown-1.png"];
        
        
        setNav.tabBarItem.title = @"设置";
        setNav.tabBarItem.image = [UIImage imageNamed:@"Unknown-2.png"];
        setNav.tabBarItem.selectedImage = [UIImage imageNamed:@"Unknown-3.png"];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        [tabBarController addChildViewController:firstNav];
        [tabBarController addChildViewController:ProtalNav];
        [tabBarController addChildViewController:setNav];
        
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
    
    //05.17 修改
    [self loadTabVC];
//    self.window.rootViewController = tabBarControllerMain;
    
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





- (void) loadTabVC {
    //home page
    
    NSMutableDictionary *tabAttrs = [NSMutableDictionary dictionaryWithCapacity: 3];
    tabAttrs[@"tabTitle"] = @"首页";
    tabAttrs[@"title"] = @"首页";
    tabAttrs[@"itemNormal"] = @"Unknown.png";
    tabAttrs[@"itemSelected"] = @"Unknown-1.png";
    tabAttrs[@"rootVC"] = @"ViewController";
    UINavigationController *homeNavVC = [self tabNavVCWithAttr: tabAttrs];
    //    self.MyNav = homeNavVC;
    //found page
    tabAttrs[@"tabTitle"] = @"视图";
    tabAttrs[@"title"] = @"视图";
    tabAttrs[@"itemNormal"] = @"Unknown.png";
    tabAttrs[@"itemSelected"] = @"Unknown-1.png";
    tabAttrs[@"rootVC"] = @"ProtalViewController";
    UINavigationController *gouCaiNavVC = [self tabNavVCWithAttr: tabAttrs];
    //provide page
    tabAttrs[@"tabTitle"] = @"设置";
    tabAttrs[@"title"] = @"设置";
    tabAttrs[@"itemNormal"] = @"Unknown-2.png";
    tabAttrs[@"itemSelected"] = @"Unknown-3.png";
    tabAttrs[@"rootVC"] = @"SetViewController";
    UINavigationController *faXianNavVC = [self tabNavVCWithAttr: tabAttrs];
    
    tabBarControllerMain = [[UITabBarController alloc] init];
    tabBarControllerMain.viewControllers = @[homeNavVC, gouCaiNavVC, faXianNavVC];
    tabBarControllerMain.view.frame = CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height);
    tabBarControllerMain.delegate = self;
    tabBarControllerMain.view.backgroundColor = [UIColor clearColor];
    tabBarControllerMain.tabBar.barStyle = UIBarStyleBlackOpaque;
    tabBarControllerMain.tabBar.barTintColor = [UIColor whiteColor];
    tabBarControllerMain.delegate = self;
}




//05.17 change
- (UINavigationController *) tabNavVCWithAttr: (NSDictionary*) attrs {
    UIImage *normalImage = [[UIImage imageNamed: attrs[@"itemNormal"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed: attrs[@"itemSelected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle: attrs[@"tabTitle"] image: normalImage selectedImage: selectedImage];
    NSDictionary *normalAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:12], NSForegroundColorAttributeName: [UIColor blackColor]};
    [tabBarItem setTitleTextAttributes: normalAttributes forState:UIControlStateNormal];
    
    NSDictionary *selectedAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:12], NSForegroundColorAttributeName: [UIColor redColor]};
    [tabBarItem setTitleTextAttributes: selectedAttributes forState:UIControlStateSelected];
    NSString *rootVCClassName = attrs[@"rootVC"];
    UIViewController *rootVC = [[NSClassFromString(rootVCClassName) alloc] initWithNibName: rootVCClassName bundle: nil];
    rootVC.title = attrs[@"title"];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController: rootVC];
//    navVC.navigationBar.barTintColor = RGBCOLOR(225, 91, 50);
    
    navVC.tabBarItem = tabBarItem;
    //navtigation bar title color
    
    navVC.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
    navVC.navigationBar.tintColor = [UIColor whiteColor];
    return navVC;
}


@end
