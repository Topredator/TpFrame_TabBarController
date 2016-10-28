//
//  NSURL+XL_URLQuery.h
//  XL_Demos
//
//  Created by zhouxiaolu on 16/9/21.
//  Copyright © 2016年 Topredator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (XL_URLQuery)
/* 
 *  @return URL's query filter token
 */
+ (NSURL *)urlFilterToken:(NSString *)url;
/**
 *  @return URL's query component as keys/values
 *  Returns nil for an empty query
 */
- (NSDictionary *)xl_queryDictionary;
/**
 *  @return URL with keys values appending to query string
 *  @param queryDictionary Query keys/values
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @warning If keys overlap in receiver and query dictionary,
 *  behaviour is undefined.
 */
- (NSURL *)xl_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary
                                 sortedKeys:(BOOL)sortedKeys;
/*
 * As above, but `sortedKeys=NO` 
 */
- (NSURL *)xl_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary;
/*
 * @return Receiver with query component completely removed 
 */
- (NSURL *)xl_URLByRemoveQuery;
@end

@interface NSString (XL_URLQuery)
/**
 *  @return If the receiver is a valid URL query component, returns
 *  components as key/value pairs. If couldn't split into *any* pairs,
 *  returns nil.
 */
- (NSDictionary *)xl_URLQueryDictionary;
@end

@interface NSDictionary (XL_URLQuery)
/**
 *  @return URL query string component created from the keys and values in
 *  the dictionary. Returns nil for an empty dictionary.
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @see cavetas from the main `NSURL` category as well.
 */
- (NSString *)xl_URLQueryStringWithSortedKeys:(BOOL)sortedKeys;
/*
 *  As above, but `sortedKeys=NO`
 */
- (NSString *)xl_URLQueryString;
@end
