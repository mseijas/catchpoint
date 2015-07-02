//
//  CPSyntheticChart.m
//  Catchpoint
//
//  Created by Matias on 6/26/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPSyntheticChart.h"

@implementation CPSyntheticChart

+ (LineChartView *)initChart:(LineChartView *)chartView withData:(NSArray *)data includeMetrics:(NSArray *)metrics {
    
//    LineChartView *chartView = [[LineChartView alloc] init];
    
    
    // Get Time Stamps array and use it to generate labels for X Values
    NSArray *timeStamps = [CPAPIParser getLocalTimeStampFromSyntheticData:data withOptions:TimeStampFormatTime];
    NSArray *xValues = timeStamps;

    
    // Generate Y-Value datasets
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    
    for (int i=0 ; i < metrics.count ; i++) {
        SyntheticMetricType metricType = (SyntheticMetricType)[metrics[i] intValue];
        NSLog(@"Synthetic Metric Type: %ld", metricType);
        
        NSArray *metricData = [CPAPIParser getMetric:metricType fromSyntheticData:data average:nil];
        NSMutableArray *yValues = [[NSMutableArray alloc] init];
        
        for (NSNumber *metricNum in metricData) {
            double metricValue = (double)[metricNum doubleValue];
//            NSLog(@"metric value = %f", metricValue);
            
            [yValues addObject:[[ChartDataEntry alloc] initWithValue:metricValue xIndex:[metricData indexOfObject:metricNum]]];
        }
        NSLog(@"YValues: %@", yValues);
        
        LineChartDataSet *metricDataSet = [[LineChartDataSet alloc] initWithYVals:yValues label:[CPAPIParser metricNameForType:metricType]];
        [metricDataSet setColor:[CPAPIParser metricColorForType:metricType]];
        metricDataSet.lineWidth = 3.0;
        metricDataSet.drawCirclesEnabled = NO;
        
        [dataSets addObject:metricDataSet];
        NSLog(@"DATA SETS: %@", dataSets);
    }
    
    LineChartData *chartData = [[LineChartData alloc] initWithXVals:xValues dataSets:dataSets];
    [chartData setDrawValues:NO];
    
    // Associate chartData view chart
    chartView.data = chartData;
    
    
    // Style chart
    [chartView setDrawBordersEnabled:YES];
    [chartView setDrawGridBackgroundEnabled:NO];
    [chartView setDragEnabled:NO];
    [chartView setHighlightEnabled:NO];
    [chartView setScaleEnabled:YES];
    
    chartView.borderColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.35];
    chartView.descriptionText = @"";
    chartView.pinchZoomEnabled = YES;
    chartView.xAxis.labelPosition = ChartLimitLabelPositionRight;
    
    
    // Style axes
    ChartYAxis *rightYAxis = chartView.rightAxis;
    [rightYAxis setDrawLabelsEnabled:NO];
    [rightYAxis setDrawAxisLineEnabled:NO];
    rightYAxis.startAtZeroEnabled = NO;
    rightYAxis.gridColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.1];
    
    ChartYAxis *leftYAxis = chartView.leftAxis;
    [leftYAxis setDrawLabelsEnabled:YES];
    [leftYAxis setDrawAxisLineEnabled:NO];
    [leftYAxis setDrawGridLinesEnabled:NO];
    leftYAxis.startAtZeroEnabled = NO;
    leftYAxis.labelPosition = ChartLimitLabelPositionLeft;
    
    ChartXAxis *xAxis = chartView.xAxis;
    [xAxis setDrawGridLinesEnabled:NO];
    [xAxis setDrawAxisLineEnabled:NO];
    
    return chartView;
}

@end
