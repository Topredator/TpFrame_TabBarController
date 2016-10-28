//
//  UIView+XLAdd.h
//  XL_Demos
//
//  Created by zhouxiaolu on 16/6/21.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XLAdd)
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;
//  清空子视图
- (void)removeAllSubViews;
@end
