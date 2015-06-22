//
//  CPParser.h
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPSyntheticMetrics.h"

@interface CPParser : NSObject

+ (NSString *)getTestNameFromSyntheticData:(NSArray *)data;

+ (NSArray *)getMetric:(SyntheticMetricType)metricType fromSyntheticData:(NSArray *)data;
+ (NSArray *)getTimeStampFromSyntheticData:(NSArray *)data;

+ (NSString *)metricNameForType:(SyntheticMetricType)metricType;

@end
