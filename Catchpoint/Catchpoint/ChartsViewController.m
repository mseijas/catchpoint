//
//  ChartsViewController.m
//  Catchpoint
//
//  Created by Matias on 6/24/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "ChartsViewController.h"
#import "CPAPIRequest.h"
#import "CPParser.h"

@import Charts;

@interface ChartsViewController ()

@property (weak, nonatomic) IBOutlet LineChartView *chartView;

@end

@implementation ChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *data = [CPAPIRequest getPerformanceForTest:@"33621" raw:NO];
    
    NSArray *webResponse = [CPParser getMetric:SyntheticMetricWebpageResponse fromSyntheticData:data];
    
    
    // Generate x values
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < webResponse.count; i++) {
        [xVals addObject:[@(i) stringValue]];
    }
    
    // Generate y values
    NSMutableArray *yVals = [[NSMutableArray alloc] init];

    for (int i = 0; i < webResponse.count; i++) {
        
        NSNumber *webResponseNum = webResponse[i];
        double webResponseValue = (double)[webResponseNum doubleValue];
        
        [yVals addObject:[[ChartDataEntry alloc] initWithValue:webResponseValue xIndex:i]];
    }
    
    // Generate line chart data set
    LineChartDataSet *webResponseDataSet = [[LineChartDataSet alloc] initWithYVals:yVals label:@"Webpage Response"];
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:webResponseDataSet];
    
    LineChartData *lineChartData = [[LineChartData alloc] initWithXVals:xVals dataSets:dataSets];
    
    
    // Associate line chart data to chart object
    self.chartView.data = lineChartData;
}

@end
