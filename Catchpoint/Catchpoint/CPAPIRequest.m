//
//  CPAPIRequest.m
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIManager.h"

#import "CPAPIRequest.h"

@implementation CPAPIRequest

- (NSDictionary *)getPerformanceForTest:(NSString *)testId {
    
    NSString *requestURI = [NSString stringWithFormat:@"https://io.catchpoint.com/ui/api/v%@/performance/raw?tests=%@", [CPAPIManager apiVersion], testId];
    
    NSDictionary *rawData = [CPAPIManager GET:requestURI];
    
    return rawData;
}

- (NSDictionary *)getFavoriteChartList {
    
    NSString *requestURI = [NSString stringWithFormat:@"https://io.catchpoint.com/ui/api/v%@/performance/favoriteCharts", [CPAPIManager apiVersion]];
    NSLog(@"Processing GET: %@", requestURI);
    
    NSDictionary *rawData = [CPAPIManager GET:requestURI];
    
    return rawData;
}

- (NSDictionary *)getFavoriteChartDetails:(NSString *)favoriteId {
    
    NSString *requestURI = [NSString stringWithFormat:@"https://io.catchpoint.com/ui/api/v%@/performance/favoriteCharts/%@", [CPAPIManager apiVersion], favoriteId];
    NSLog(@"Processing GET: %@", requestURI);
    
    NSDictionary *rawData = [CPAPIManager GET:requestURI];
    
    return rawData;
}

@end
