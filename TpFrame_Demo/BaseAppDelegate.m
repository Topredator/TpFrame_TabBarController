//
//  BaseAppDelegate.m
//  TpFrame_Demo
//
//  Created by zhouxiaolu on 16/10/27.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "BaseAppDelegate.h"
#import "XLBaseTabBarController.h"



@interface BaseAppDelegate ()
@property (nonatomic, strong) XLBaseTabBarController *tabBarController;
@property (nonatomic, readonly) UIApplication *application;
@end


@implementation BaseAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _application = application;
    [self loadUIComponent];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark - private method -
- (void)loadUIComponent
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self enterApp];
    [self.window makeKeyAndVisible];
    [_application setStatusBarStyle:UIStatusBarStyleDefault];
}
- (void)enterApp
{
    if (_tabBarController) return;
    Class rootViewController = [XLBaseTabBarController class];
    if (![rootViewController isSubclassOfClass:[XLBaseTabBarController class]]) return;
    
    self.tabBarController = [XLBaseTabBarController new];
    self.window.rootViewController = _tabBarController;
}
@end
