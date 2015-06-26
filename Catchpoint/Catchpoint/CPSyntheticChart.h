//
//  CPSyntheticChart.h
//  Catchpoint
//
//  Created by Matias on 6/26/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

@import Charts;
#import "CPAPIParser.h"

@interface CPSyntheticChart : NSObject

+ (LineChartView *)initWithChart:(LineChartView *)chartView data:(NSArray *)data includeMetrics:(NSArray *)metrics;

@end
