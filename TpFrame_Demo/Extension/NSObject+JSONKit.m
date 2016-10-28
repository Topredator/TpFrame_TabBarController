//
//  NSObject+JSONKit.m
//  XL_Demos
//
//  Created by zhouxiaolu on 16/9/6.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "NSObject+JSONKit.h"

@implementation NSObject (JSONKit)
- (NSString *)JSONRepresentation
{
    //  是否有效
    if ([NSJSONSerialization isValidJSONObject:self])
    {
        NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
        NSString *value = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return value;
    }
    return nil;
}
@end
