//
//  NSString+JsonKit.m
//  XL_Demos
//
//  Created by zhouxiaolu on 16/9/1.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "NSString+JsonKit.h"

@implementation NSString (JsonKit)
- (instancetype)JSONValue
{
    return [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
}
- (NSData *)JSONData
{
    NSError *parseError = nil;
    return([NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError]);
}
@end
