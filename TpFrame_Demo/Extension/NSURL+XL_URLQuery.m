//
//  NSURL+XL_URLQuery.m
//  XL_Demos
//
//  Created by zhouxiaolu on 16/9/21.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import "NSURL+XL_URLQuery.h"

static NSString *const kQuerySeparator      = @"&";
static NSString *const kQueryDivider        = @"=";
static NSString *const kQueryBegin          = @"?";
static NSString *const kFragmentBegin       = @"#";

@implementation NSURL (XL_URLQuery)
+ (NSURL *)urlFilterToken:(NSString *)url
{
    if (!url || !url.length) return nil;
    if (![url containsString:@"token="] || ![url containsString:kQueryBegin])
        return [NSURL URLWithString:url];
    
    NSArray *arr = [url componentsSeparatedByString:kQueryBegin];
    NSString *param = arr[1];
    NSDictionary *dic = param.xl_URLQueryDictionary;
    NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [mdic removeObjectForKey:@"token"];
    NSString *paramStr = [mdic xl_URLQueryStringWithSortedKeys:NO];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", arr[0], paramStr];
    return [NSURL URLWithString:urlStr];
}
- (NSDictionary *)xl_queryDictionary
{
    return self.query.xl_URLQueryDictionary;
}
- (NSURL *)xl_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary
                                 sortedKeys:(BOOL)sortedKeys
{
    NSMutableArray *queries = [self.query length] > 0 ? @[self.query].mutableCopy : @[].mutableCopy;
    NSString *dictionaryQuery = [queryDictionary xl_URLQueryStringWithSortedKeys:sortedKeys];
    if (dictionaryQuery) {
        [queries addObject:dictionaryQuery];
    }
    NSString *newQuery = [queries componentsJoinedByString:kQuerySeparator];
    
    if (newQuery.length) {
        NSArray *queryComponents = [self.absoluteString componentsSeparatedByString:kQueryBegin];
        if (queryComponents.count) {
            return [NSURL URLWithString:
                    [NSString stringWithFormat:@"%@%@%@%@%@",
                     queryComponents[0],                      // existing url
                     kQueryBegin,
                     newQuery,
                     self.fragment.length ? kFragmentBegin : @"",
                     self.fragment.length ? self.fragment : @""]];
        }
    }
    return self;
    
}
- (NSURL *)xl_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary
{
    return [self xl_URLByAppendingQueryDictionary:queryDictionary sortedKeys:NO];
}
- (NSURL *)xl_URLByRemoveQuery
{
    NSArray *queryComponents = [self.absoluteString componentsSeparatedByString:kQueryBegin];
    if (queryComponents.count) {
        return [NSURL URLWithString:queryComponents.firstObject];
    }
    return self;
}
@end

@implementation NSString (XL_URLQuery)
- (NSDictionary*)xl_URLQueryDictionary
{
    NSMutableDictionary *mute = @{}.mutableCopy;
    for (NSString *query in [self componentsSeparatedByString:kQuerySeparator]) {
        NSArray *components = [query componentsSeparatedByString:kQueryDivider];
        if (components.count == 0) {
            continue;
        }
        NSString *key = [components[0] stringByRemovingPercentEncoding];
        id value = nil;
        if (components.count == 1) {
            // key with no value
            value = [NSNull null];
        }
        if (components.count == 2) {
            value = [components[1] stringByRemovingPercentEncoding];
            // cover case where there is a separator, but no actual value
            value = [value length] ? value : [NSNull null];
        }
        if (components.count > 2) {
            // invalid - ignore this pair. is this best, though?
            continue;
        }
        mute[key] = value ?: [NSNull null];
    }
    return mute.count ? mute.copy : nil;
}

- (NSString*)xl_stringByPercentageEncodingWithReservedCharacters
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:
            [NSCharacterSet URLQueryAllowedCharacterSet]];
}
@end

@implementation NSDictionary (XL_URLQuery)
- (NSString *)xl_URLQueryString {
    return [self xl_URLQueryStringWithSortedKeys:NO];
}

- (NSString*)xl_URLQueryStringWithSortedKeys:(BOOL)sortedKeys {
    NSMutableString *queryString = @"".mutableCopy;
    NSArray *keys = sortedKeys ? [self.allKeys sortedArrayUsingSelector:@selector(compare:)] : self.allKeys;
    for (NSString *key in keys) {
        id rawValue = self[key];
        NSString *value = nil;
        // beware of empty or null
        if (!(rawValue == [NSNull null] || ![rawValue description].length)) {
            value = [self[key] description];
        }
        [queryString appendFormat:@"%@%@%@%@",
         queryString.length ? kQuerySeparator : @"",    // appending?
         key,
         value ? kQueryDivider : @"",
         value ? value : @""];
    }
    return queryString.length ? [queryString xl_stringByPercentageEncodingWithReservedCharacters] : nil;
}

@end
