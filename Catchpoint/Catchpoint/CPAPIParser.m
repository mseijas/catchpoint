//
//  CPAPIParser.m
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIParser.h"
#import "TimeUtils.h"


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


@end
