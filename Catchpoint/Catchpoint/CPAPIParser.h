//
//  CPAPIParser.h
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPSyntheticMetrics.h"

typedef NS_ENUM(NSInteger, TimeStampFormatOptions) {
    TimeStampFormatFullDate = 0,
    TimeStampFormatDate = 1,
    TimeStampFormatTime = 2
};

@interface CPAPIParser : NSObject

+ (NSString *)getTestNameFromSyntheticData:(NSArray *)data;

+ (NSArray *)getMetric:(SyntheticMetricType)metricType fromSyntheticData:(NSArray *)data;
+ (NSArray *)getUTCTimeStampFromSyntheticData:(NSArray *)data;
+ (NSArray *)getUTCTimeObjectsFromSyntheticData:(NSArray *)data;
+ (NSArray *)getLocalTimeStampFromSyntheticData:(NSArray *)data withOptions:(TimeStampFormatOptions)formatOption;

+ (NSString *)metricNameForType:(SyntheticMetricType)metricType;
+ (UIColor *)metricColorForType:(SyntheticMetricType)metricType;

+ (NSDictionary *)getAllProductsForData:(NSArray *)data;

@end
