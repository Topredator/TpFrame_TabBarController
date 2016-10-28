//
//  UIColor+Extension.m
//  XL_Demos
//
//  Created by zhouxiaolu on 16/6/20.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+ (UIColor *)hexChangeFloat:(NSString *)hexColor
{
    return [UIColor hexChangeFloat:hexColor alpha:1.f];
}
+ (UIColor *)hexChangeFloat:(NSString *)hexColor alpha:(CGFloat)alpha
{
    unsigned int redInt, greenInt, blueInt;
    NSRange range;
    //  红、绿、蓝 范围各2
    range.length = 2;
    
    //  红色的值
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&redInt];
    
    //  绿色的值
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&greenInt];
    
    //  蓝色的值
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blueInt];
    
    return [UIColor colorWithRed:(float)(redInt / 255.0)
                                        green:(float)(greenInt / 255.0)
                                        blue:(float)(blueInt / 255.0)
                                        alpha:alpha];
}
+ (NSString *)convertTohexFloat:(UIColor*)color
{
    const CGFloat* rgba = CGColorGetComponents(color.CGColor);
    NSUInteger r = rgba[0]*255;
    NSUInteger g = rgba[1]*255;
    NSUInteger b = rgba[2]*255;
    NSUInteger iRGB = (r << 16) | (g << 8) | b;
    return [NSString stringWithFormat:@"%lx", (unsigned long)iRGB];
}
@end
