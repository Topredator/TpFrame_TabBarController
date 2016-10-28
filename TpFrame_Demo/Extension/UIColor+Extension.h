//
//  UIColor+Extension.h
//  XL_Demos
//
//  Created by zhouxiaolu on 16/6/20.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIColor (Extension)
//  16进制  颜色值 ——> color
+ (UIColor *)hexChangeFloat:(NSString *)hexColor;
+ (UIColor *)hexChangeFloat:(NSString *)hexColor alpha:(CGFloat)alpha;
//  color ——>  16进制  颜色值
+ (NSString *)convertTohexFloat:(UIColor*)color;
@end
