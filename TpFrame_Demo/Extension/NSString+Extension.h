//
//  NSString+Extension.h
//  XL_Demos
//
//  Created by zhouxiaolu on 16/7/27.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
+ (CGFloat)valueForString:(NSString *)string font:(UIFont *)font Type:(u_int)type num_Value:(CGFloat)num_Value;
//  首字母小写
- (NSString *)lowercaseFirstCharacter;
//  首字母大写
- (NSString *)uppercaseFirstCharacter;
//  判断是否为空
- (BOOL)isEmpty;
- (BOOL)isNotEmpty;
//  判断是否包含
- (BOOL)containsString:(NSString *)aString;

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;
@end
