//
//  CPAPIRequest.h
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPAPIRequest : NSObject

+ (NSDictionary *)getPerformanceForTest:(NSString *)testId;

+ (NSDictionary *)getFavoriteChartList;
+ (NSDictionary *)getFavoriteChartDetails:(NSString *)favoriteId;
+ (NSDictionary *)getFavoriteChartData:(NSString *)favoriteId;

@end
