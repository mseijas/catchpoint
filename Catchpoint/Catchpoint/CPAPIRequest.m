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

+ (id)getPerformanceForTest:(NSString *)testId raw:(BOOL)raw {
    
    NSString *requestURI = [NSString stringWithFormat:@"/performance/raw?tests=%@", testId];
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    if (rawData) {
        if (raw == NO) {
            
            NSArray *items = rawData[@"detail"][@"items"];
            
            return items;
        }
        
        return rawData;
    }
    
    return nil;
}

+ (NSDictionary *)getFavoriteChartList {
    
    NSString *requestURI = @"/performance/favoriteCharts";
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
}

+ (NSDictionary *)getFavoriteChartDetails:(NSString *)favoriteId {
    
    NSString *requestURI = [NSString stringWithFormat:@"/performance/favoriteCharts/%@", favoriteId];
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
}

+ (NSDictionary *)getFavoriteChartData:(NSString *)favoriteId {
    
    NSString *requestURI = [NSString stringWithFormat:@"/performance/favoriteCharts/%@/data", favoriteId];
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
}

+ (NSDictionary *)getNodeList {
    
    NSString *requestURI = @"/nodes";
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
}

+ (NSDictionary *)getNodeDetails:(NSString *)nodeId {
    
    NSString *requestURI = [NSString stringWithFormat:@"/nodes/%@", nodeId];
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
}

@end
