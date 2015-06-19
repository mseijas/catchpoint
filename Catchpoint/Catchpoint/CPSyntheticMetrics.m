//
//  CPSyntheticMetrics.m
//  Catchpoint
//
//  Created by Matias on 6/19/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPSyntheticMetrics.h"

@implementation CPSyntheticMetrics

+ (NSString *)metricNameForType:(SyntheticMetricType)metricType {
    NSString *result = nil;
    
    switch(metricType) {
        case SyntheticMetricDNS:
            result = @"DNS (ms)";
            break;
        case SyntheticMetricConnect:
            result = @"Connect (ms)";
            break;
        case SyntheticMetricSSL:
            result = @"SSL (ms)";
            break;
        case SyntheticMetricSend:
            result = @"Send (ms)";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected SyntheticMetricType"];
    }
    
    return result;
}

@end
