//
//  NSString+JsonKit.h
//  XL_Demos
//
//  Created by zhouxiaolu on 16/9/1.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JsonKit)
- (instancetype)JSONValue;
- (NSData *)JSONData;
@end
