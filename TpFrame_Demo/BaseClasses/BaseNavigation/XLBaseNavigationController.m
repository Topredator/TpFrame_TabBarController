//
//  XLBaseNavigationController.m
//  TpFrame_Demo
//
//  Created by zhouxiaolu on 16/10/27.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "XLBaseNavigationController.h"

@interface XLBaseNavigationController ()

@end

@implementation XLBaseNavigationController
#pragma mark - init method -
+ (void)load
{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *itemDic = @{}.mutableCopy;
    itemDic[NSFontAttributeName] = kFont(15);
    itemDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:itemDic forState:UIControlStateNormal];
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [bar setBackgroundImage:[UIImage imageWithColor:RGBA(250, 227, 111, 1)] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *barDic = @{}.mutableCopy;
    barDic[NSFontAttributeName] = kFont(15);
    [bar setTitleTextAttributes:barDic];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
