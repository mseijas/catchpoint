//
//  ChartsViewController.m
//  Catchpoint
//
//  Created by Matias on 6/24/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "ChartsViewController.h"
#import "CPAPIRequest.h"
#import "CPAPIParser.h"

#import "CPSyntheticChart.h"

@import Charts;

@interface ChartsViewController ()

@property (weak, nonatomic) IBOutlet LineChartView *chartView;
@property (weak, nonatomic) IBOutlet LineChartView *availabilityChartView;

@end

@implementation ChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *data = [CPAPIRequest getPerformanceForTest:@"33621" raw:NO];
    NSArray *metrics = [NSArray arrayWithObjects:[NSNumber numberWithInteger:SyntheticMetricWebpageResponse],
                                                [NSNumber numberWithInteger:SyntheticMetricResponse]                                                 ,nil];
    
    self.chartView = [CPSyntheticChart initChart:self.chartView withData:data includeMetrics:metrics];
    
    self.availabilityChartView = [CPSyntheticChart initChart:self.availabilityChartView
                                                    withData:data
                                              includeMetrics:[NSArray arrayWithObjects:[NSNumber numberWithInteger:SyntheticMetricLoad], nil]];
    
    self.availabilityChartView.leftAxis.startAtZeroEnabled = YES;
    self.availabilityChartView.rightAxis.startAtZeroEnabled = YES;
//    self.availabilityChartView.leftAxis.spaceTop = 1;
//    self.availabilityChartView.rightAxis.spaceTop = 1;
    
}

@end
