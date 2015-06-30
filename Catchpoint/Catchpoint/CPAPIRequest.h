//
//  CPAPIRequest.h
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPAPIRequest : NSObject
 
+ (id)getPerformanceForTest:(NSString *)testId raw:(BOOL)raw;

+ (NSDictionary *)getFavoriteChartList;
+ (NSDictionary *)getFavoriteChartDetails:(NSString *)favoriteId;
+ (NSDictionary *)getFavoriteChartData:(NSString *)favoriteId;

+ (NSDictionary *)getAllProducts;
+ (NSDictionary *)getProductsForPage:(int)page;

+ (NSArray *)getAllTests;
+ (NSDictionary *)getTestsForPage:(int)page;

+ (NSDictionary *)getNodeList;
+ (NSDictionary *)getNodeDetails:(NSString *)nodeId;

@end
