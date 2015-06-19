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

+ (NSDictionary *)getPerformanceForTest:(NSString *)testId {
    
    NSString *requestURI = [NSString stringWithFormat:@"/performance/raw?tests=%@", testId];
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
}

+ (NSDictionary *)getFavoriteChartList {
    
    NSString *requestURI = @"/performance/favoriteCharts";
    
    NSDictionary *rawData = [CPAPIManager GET:requestURI];
    
    return rawData;
}

+ (NSDictionary *)getFavoriteChartDetails:(NSString *)favoriteId {
    
    NSString *requestURI = [NSString stringWithFormat:@"/performance/favoriteCharts/%@", favoriteId];
    
    NSDictionary *rawData = [CPAPIManager GET:requestURI];
    
    return rawData;
}

+ (NSDictionary *)getFavoriteChartData:(NSString *)favoriteId {
    
    NSString *requestURI = [NSString stringWithFormat:@"/performance/favoriteCharts/%@/data", favoriteId];
    
    NSDictionary *rawData = [CPAPIManager GET:requestURI];
    
    return rawData;
}

@end
