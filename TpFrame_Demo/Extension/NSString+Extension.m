//
//  NSString+Extension.m
//  XL_Demos
//
//  Created by zhouxiaolu on 16/7/27.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
+ (CGFloat)valueForString:(NSString *)string font:(UIFont *)font Type:(u_int)type num_Value:(CGFloat)num_Value
{
    if (type == 0)
    {
        CGRect rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, num_Value) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : font} context:nil];
        return rect.size.width;
    }
    CGRect rect = [string boundingRectWithSize:CGSizeMake(num_Value, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : font} context:nil];
    return rect.size.height;
}

- (NSString *)lowercaseFirstCharacter {
    NSRange range = NSMakeRange(0,1);
    NSString *lowerFirstCharacter = [[self substringToIndex:1] lowercaseString];
    return [self stringByReplacingCharactersInRange:range withString:lowerFirstCharacter];
}

- (NSString *)uppercaseFirstCharacter {
    NSRange range = NSMakeRange(0,1);
    NSString *upperFirstCharacter = [[self substringToIndex:1] uppercaseString];
    return [self stringByReplacingCharactersInRange:range withString:upperFirstCharacter];
}

- (BOOL)isEmpty {
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [self stringByTrimmingCharactersInSet:charSet];
    return [trimmed isEqualToString:@""];
}

- (BOOL)isNotEmpty {
    return ![self isEmpty];
}

- (BOOL)containsString:(NSString *)aString
{
    if (aString) {
        NSRange range = [[self lowercaseString] rangeOfString:[aString lowercaseString]];
        return range.location != NSNotFound;
    }
    return NO;
}
- (NSString *)URLEncodedString
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                 kCFAllocatorDefault,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                 kCFStringEncodingUTF8));
}
- (NSString *)URLDecodedString
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                                                 kCFAllocatorDefault,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 kCFStringEncodingUTF8));
}
@end
