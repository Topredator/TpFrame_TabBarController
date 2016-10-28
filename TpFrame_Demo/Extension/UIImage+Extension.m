//
//  UIImage+Extension.m
//  TpFrame_Demo
//
//  Created by zhouxiaolu on 16/10/27.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    //描述一个矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    //获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //使用color演示填充上下文
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    
    //渲染上下文
    CGContextFillRect(ctx, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}
@end
