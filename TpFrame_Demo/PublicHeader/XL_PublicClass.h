//
//  XL_PublicClass.h
//  XL_Demos
//
//  Created by zhouxiaolu on 16/6/20.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#ifndef XL_PublicClass_h
#define XL_PublicClass_h
// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define kScreenFrame  [[UIScreen mainScreen] bounds]
#define kScreenFrame_width  kScreenFrame.size.width
#define kScreenFrame_height  kScreenFrame.size.height
#define kRatio_Screen   kScreenFrame_width / 320
//  font
#define kFont(i)  [UIFont systemFontOfSize:i]

#define  kSystem_Version_iOS9   [[[UIDevice currentDevice] systemVersion] floatValue] >= 9
#define  kSystem_Version_iOS8   [[[UIDevice currentDevice] systemVersion] floatValue] >= 8
#define  kSystem_Version_iOS7   [[[UIDevice currentDevice] systemVersion] floatValue] >= 7

//  版本号
#define kVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//  图片默认 (缺省图)
#define kDefaultAvater @""  //  头像
#define kDefaultImage  @""  //  图片

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define BS(blockSelf)  __block __typeof(&*self)blockSelf = self;

#endif /* XL_PublicClass_h */
