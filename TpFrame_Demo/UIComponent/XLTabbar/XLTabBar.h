//
//  XLTabBar.h
//  TpFrame_Demo
//
//  Created by zhouxiaolu on 16/10/27.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XLTabBar;

@protocol XLTabBarDelegate <NSObject>
@optional
- (void)XLTabBarPlusBtnClickAction:(XLTabBar *)tabBar;
@end

@interface XLTabBar : UITabBar
@property (nonatomic, weak) id <XLTabBarDelegate> xlDelegate;
@end
