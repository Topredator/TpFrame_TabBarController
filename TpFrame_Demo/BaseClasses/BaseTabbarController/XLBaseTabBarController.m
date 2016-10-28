//
//  XLBaseTabBarController.m
//  TpFrame_Demo
//
//  Created by zhouxiaolu on 16/10/27.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "XLBaseTabBarController.h"
#import "XLBaseNavigationController.h"

#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "SettingViewController.h"
#import "PublishViewController.h"


#import "XLTabBar.h"

@interface XLBaseTabBarController ()<XLTabBarDelegate>

@end

@implementation XLBaseTabBarController
#pragma mark - init method -

/**
 第一次使用当前类 设置normal / selected  (字号大小、字体颜色)
 */
+ (void)initialize
{
    UITabBarItem *tabbarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *normalDic = @{}.mutableCopy;
    normalDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalDic[NSFontAttributeName] = kFont(11);
    
    NSMutableDictionary *selectedDic = @{}.mutableCopy;
    selectedDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    selectedDic[NSFontAttributeName] = kFont(11);
    
    [tabbarItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    [tabbarItem setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
}
#pragma mark - life cycle method -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadChildViewControllers];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    XLTabBar *tabBar = [XLTabBar new];
    tabBar.xlDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabBar forKey:@"tabBar"];
}
#pragma mark - XLTabBar delegate -
- (void)XLTabBarPlusBtnClickAction:(XLTabBar *)tabBar
{
    PublishViewController *publishVC = [PublishViewController new];
    publishVC.view.backgroundColor = [UIColor whiteColor];
    XLBaseNavigationController *navi = [[XLBaseNavigationController alloc] initWithRootViewController:publishVC];
    [self presentViewController:navi animated:YES completion:nil];
}
#pragma mark - private method -
/**
 加载 ChildViewControllers
 */
- (void)loadChildViewControllers
{
    HomeViewController *homeVC = [HomeViewController new];
    [self setSingleChildViewController:homeVC image:@"home_normal" selectedImage:@"home_highlight" title:@"主页"];
    
    SettingViewController *settingVC = [SettingViewController new];
    [self setSingleChildViewController:settingVC image:@"fish_normal" selectedImage:@"fish_highlight" title:@"设置"];
    
    MessageViewController *messageVC = [MessageViewController new];
    [self setSingleChildViewController:messageVC image:@"message_normal" selectedImage:@"message_highlight" title:@"消息"];
    
    MineViewController *mineVC = [MineViewController new];
    [self setSingleChildViewController:mineVC image:@"account_normal" selectedImage:@"account_highlight" title:@"我的"];
}

/**
 设置单个 ChildViewController

 @param viewController ChildViewController
 @param image          tabbarItem image
 @param selectedImage  tabbarItem selectedImage
 @param title          tabbarItem title
 */
- (void)setSingleChildViewController:(UIViewController *)viewController
                               image:(NSString *)image
                       selectedImage:(NSString *)selectedImage
                               title:(NSString *)title
{
    XLBaseNavigationController *navigationController = [[XLBaseNavigationController alloc] initWithRootViewController:viewController];
    
    UIImage *itemImage = [UIImage imageNamed:image];
    itemImage = [itemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = itemImage;
    
    UIImage *itemSelectedImage = [UIImage imageNamed:selectedImage];
    itemSelectedImage = [itemSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = itemSelectedImage;
    
    NSString *titleStr = title.length ? title : @"空白";
    viewController.tabBarItem.title = titleStr;
    viewController.navigationItem.title = titleStr;
    
    [self addChildViewController:navigationController];
}
@end
