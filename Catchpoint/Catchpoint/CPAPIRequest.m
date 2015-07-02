//
//  CPAPIRequest.m
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIManager.h"
#import "CPAPIRequest.h"
#import "DataUtils.h"


@implementation CPAPIRequest

+ (id)getPerformanceForTest:(NSString *)testId raw:(BOOL)raw {
    
    NSString *requestURI = [NSString stringWithFormat:@"/performance/raw?tests=%@", testId];
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    //NSLog(@"%@", [DataUtils dataToJSON:rawData]);
    
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

+ (NSArray *)getAllProducts {
    
    int page = 0;
    
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    NSDictionary *rawData = [self getProductsForPage:page];
    [products addObjectsFromArray:rawData[@"items"]];
    
    page++;
    
    
    do {
        // NSLog(@"Getting more data...");
        
        rawData = [self getProductsForPage:page];
        [products addObjectsFromArray:rawData[@"items"]];
        page++;
        
    } while ([rawData[@"has_more"]  isEqual: @YES]);
    
    return products;
}

+ (NSDictionary *)getProductsForPage:(int)page {
    
    NSString *requestURI = [NSString stringWithFormat:@"/products?pageNumber=%i", page];
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
    
}

+ (NSDictionary *)getTestWithID:(int)testID {
    
    NSString *requestURI = [NSString stringWithFormat:@"/tests/%i", testID];
    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
    
}

+ (NSArray *)getAllTests {
    return [self getAllTestsWithOptions:nil];
}

+ (NSArray *)getAllTestsWithName:(NSString *)testName {
    NSString *options = [NSString stringWithFormat:@"name=%@", testName];
    return [self getAllTestsWithOptions:options];
}

+ (NSArray *)getAllTestsWithOptions:(NSString *)options {
    
    int page = 0;
    
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    NSDictionary *rawData = [self getTestsForPage:page withOptions:options];
    [products addObjectsFromArray:rawData[@"items"]];
    
    page++;
    
    
    do {
        // NSLog(@"Getting more data...");
        
        rawData = [self getTestsForPage:page withOptions:options];
        [products addObjectsFromArray:rawData[@"items"]];
        page++;
        
    } while ([rawData[@"has_more"]  isEqual: @YES]);
    
    return products;
}

+ (NSDictionary *)getTestsForPage:(int)page withOptions:(NSString *)options {
    
    NSString *requestURI;
    
    if (options) {
        requestURI = [NSString stringWithFormat:@"/tests?pageNumber=%i&%@", page, options];
    }
    
    requestURI = [NSString stringWithFormat:@"/tests?pageNumber=%i", page];

    
    NSDictionary *rawData = [CPAPIManager apiGET:requestURI];
    
    return rawData;
    
}

@end
