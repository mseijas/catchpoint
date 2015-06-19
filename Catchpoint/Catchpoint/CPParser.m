//
//  CPParser.m
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPParser.h"

@implementation CPParser

+ (NSString *)getTestNameFromSyntheticData:(NSArray *)data {
    if (data) {
        NSString *testName = data[0][@"breakdown_1"][@"name"];
        return testName;
    }
    return nil;
}

+ (NSArray *)getMetric:(int)metricId fromSyntheticData:(NSArray *)data {
    if (data) {
        NSMutableArray *metricData = [[NSMutableArray alloc] init];
        
        for (int i=0; i < data.count; i++) {
            NSString *metricValueStr = data[i][@"synthetic_metrics"][metricId];
            double metricValue = [metricValueStr doubleValue];
            
            //  NSLog(@"Metric %i: %.0f", metricId, metricValue);
            
            NSNumber *value = [NSNumber numberWithDouble:metricValue];
            [metricData addObject:value];
        }
        
        return metricData;
    }
    return nil;
}

+ (NSArray *)getTimeStampFromSyntheticData:(NSArray *)data {
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



@end
