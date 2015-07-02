//
//  CPAPIParser.m
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIRequest.h"
#import "CPAPIParser.h"
#import "TimeUtils.h"

#define testTypeWeb             [UIColor colorWithRed:0.325 green:0.769 blue:0.792 alpha:1]
#define testTypeWebTransaction  [UIColor colorWithRed:0.333 green:0.541 blue:0.800 alpha:1]
#define testTypeHTML            [UIColor colorWithRed:0.855 green:0.769 blue:0.318 alpha:1]
#define testTypeFTP             [UIColor colorWithRed:0.322 green:0.792 blue:0.498 alpha:1]
#define testTypeTCP             [UIColor colorWithRed:0.824 green:0.580 blue:0.318 alpha:1]
#define testTypeDNS             [UIColor colorWithRed:0.827 green:0.439 blue:0.635 alpha:1]
#define testTypePing            [UIColor colorWithRed:0.620 green:0.459 blue:0.839 alpha:1]
#define testTypeSMTP            [UIColor colorWithRed:0.859 green:0.471 blue:0.475 alpha:1]
#define testTypeAPI             [UIColor colorWithRed:0.557 green:0.773 blue:0.286 alpha:1]
#define testTypeStreaming       [UIColor colorWithRed:0.361 green:0.659 blue:0.761 alpha:1]
#define testTypeTraceroute      [UIColor colorWithRed:0.816 green:0.431 blue:0.765 alpha:1]
#define testTypeSSH             [UIColor colorWithRed:0.188 green:0.647 blue:0.663 alpha:1]


@implementation CPAPIParser

+ (NSString *)getTestNameFromSyntheticData:(NSArray *)data {
    if (data) {
        NSString *testName = data[0][@"breakdown_1"][@"name"];
        return testName;
    }
    return nil;
}

+ (NSArray *)getMetric:(SyntheticMetricType)metricType fromSyntheticData:(NSArray *)data {
    if (data) {
//        int metricId = [metricType intValue];
        NSMutableArray *metricData = [[NSMutableArray alloc] init];
        
        for (int i=0; i < data.count; i++) {
            NSString *metricValueStr = data[i][@"synthetic_metrics"][(int)metricType];
            double metricValue = [metricValueStr doubleValue];
            
            //  NSLog(@"Metric %i: %.0f", metricId, metricValue);
            
            NSNumber *value = [NSNumber numberWithDouble:metricValue];
            [metricData addObject:value];
        }
        
        return metricData;
    }
    return nil;
}

+ (NSArray *)getUTCTimeStampFromSyntheticData:(NSArray *)data {
    if (data) {
        NSMutableArray *timeData = [[NSMutableArray alloc] init];
        for (int i=0; i < data.count; i++) {
            NSString *timeStamp = data[i][@"dimension"][@"name"];
            
            // NSLog(@"Timestamp: %@", timeStamp);
            
            [timeData addObject:timeStamp];
        }
        
        return timeData;
    }
    return nil;
}

+ (NSArray *)getUTCTimeObjectsFromSyntheticData:(NSArray *)data {
    
    NSMutableArray *timeObjects = [[NSMutableArray alloc] init];
    NSArray *timeStamps = [self getUTCTimeStampFromSyntheticData:data];
    
    for (NSString *timeString in timeStamps) {
        NSDate *utcDate = [TimeUtils utcStringToDate:timeString];
        
        [timeObjects addObject:utcDate];
    }

    return timeObjects;
}

+ (NSArray *)getLocalTimeStampFromSyntheticData:(NSArray *)data withOptions:(TimeStampFormatOptions)formatOption {
    
    NSMutableArray *localTimeStamps = [[NSMutableArray alloc] init];
    NSArray *timeObjects = [self getUTCTimeObjectsFromSyntheticData:data];
    
    for (NSDate *timeObject in timeObjects) {
        
        NSString *timeStamp;
        
        if (!formatOption || formatOption == TimeStampFormatFullDate) {
            timeStamp = [TimeUtils formatFullDate:timeObject];
        }
        if (formatOption == TimeStampFormatDate) {
            timeStamp = [TimeUtils formatDate:timeObject];
        }
        if (formatOption == TimeStampFormatTime) {
            timeStamp = [TimeUtils formatTime:timeObject];
        }
        
        [localTimeStamps addObject:timeStamp];
    }
    
    return localTimeStamps;
}

+ (NSString *)metricNameForType:(SyntheticMetricType)metricType {
    return [CPSyntheticMetrics metricNameForType:metricType];
}

+ (UIColor *)metricColorForType:(SyntheticMetricType)metricType {
    return [CPSyntheticMetrics metricColorForType:metricType];
}

+ (NSDictionary *)getAllProductsForData:(NSArray *)data {
    
    NSMutableDictionary *products = [[NSMutableDictionary alloc] init];
    
    for (int i=0; i < data.count ; i++) {
        
        NSString *productId = [NSString stringWithFormat:@"%@", data[i][@"id"]];
        NSString *productName = [NSString stringWithFormat:@"%@", data[i][@"name"]];
        
        [products setObject:productName forKey:productId];
    }
    
    return products;
}

+ (NSArray *)getAllActiveTests {
    
    NSMutableArray *activeTests = [[NSMutableArray alloc] init];
    
    NSArray *allTests = [CPAPIRequest getAllTests];
    NSDictionary *allProducts = [self getAllProductsForData:[CPAPIRequest getAllProducts]];
    
    for (int i=0; i < allTests.count ; i++) {
        
        NSDictionary *currentTest = [allTests[i] mutableCopy];

        NSString *productID = [NSString stringWithFormat:@"%@", currentTest[@"product_id"]];
        NSString *productName = [allProducts objectForKey:productID];

        
        if (productName) {
            [currentTest setValue:productName forKey:@"product_name"];
            [activeTests addObject:currentTest];
        }
    }
    
    NSLog(@"Active Tests: %@", activeTests);
    return activeTests;
}

+ (UIColor *)colorForTestTypeID:(NSNumber *)testTypeID {
    UIColor *color;
    
    switch ([testTypeID intValue]) {
        case 0:
            color = testTypeWeb;
            break;
        case 1:
            color = testTypeWebTransaction;
            break;
        case 2:
            color = testTypeHTML;
            break;
        case 3:
            color = testTypeFTP;
            break;
        case 4:
            color = testTypeTCP;
            break;
        case 5:
            color = testTypeDNS;
            break;
        case 6:
            color = testTypePing;
            break;
        case 7:
            color = testTypeSMTP;
            break;
        case 8:
            color = testTypeAPI;
            break;
        case 9:
            color = testTypeStreaming;
            break;
        case 10:
            color = testTypeSSH;
            break;
        case 11:
            color = testTypeTraceroute;
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected testTypeID"];
    }
    return color;
}

@end
