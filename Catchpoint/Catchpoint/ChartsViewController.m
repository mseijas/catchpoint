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

@end

@implementation ChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *data = [CPAPIRequest getPerformanceForTest:@"33621" raw:NO];
    NSArray *metrics = [NSArray arrayWithObjects:[NSNumber numberWithInteger:SyntheticMetricWebpageResponse],
                                                [NSNumber numberWithInteger:SyntheticMetricResponse]                                                 ,nil];
    
//    LineChartView *synthChart = ;
//    [self.view addSubview:synthChart];
    
    self.chartView = [CPSyntheticChart initWithChart:self.chartView data:data includeMetrics:metrics];
    
//    NSArray *webResponse = [CPAPIParser getMetric:SyntheticMetricWebpageResponse fromSyntheticData:data];
//    NSArray *response = [CPAPIParser getMetric:SyntheticMetricResponse fromSyntheticData:data];
//    NSArray *timeStamps = [CPAPIParser getLocalTimeStampFromSyntheticData:data withOptions:TimeStampFormatTime];
//    
//    // Generate x values
//    NSMutableArray *xVals = [[NSMutableArray alloc] init];
//    
//    for (int i = 0; i < webResponse.count; i++) {
////        [xVals addObject:[@(i) stringValue]];
//        [xVals addObject:timeStamps[i]];
//    }
//    
//    // Generate y values
//    NSMutableArray *yVals = [[NSMutableArray alloc] init];
////    NSMutableArray *yValsResponse = [[NSMutableArray alloc] init];
//    
//    for (int i = 0; i < webResponse.count; i++) {
//        
//        NSNumber *webResponseNum = webResponse[i];
//        double webResponseValue = (double)[webResponseNum doubleValue];
//        
////        NSNumber *responseNum = response[i];
////        double responseValue = (double)[responseNum doubleValue];
//        
//        [yVals addObject:[[ChartDataEntry alloc] initWithValue:webResponseValue xIndex:i]];
////        [yValsResponse addObject:[[ChartDataEntry alloc] initWithValue:responseValue xIndex:i]];
//    }
//    
//    // Generate line chart data set
//    LineChartDataSet *webResponseDataSet = [[LineChartDataSet alloc] initWithYVals:yVals label:@"Webpage Response"];
//    [webResponseDataSet setLineWidth:3.0];
//    [webResponseDataSet setDrawCirclesEnabled:NO];
//    [webResponseDataSet setColor:[UIColor colorWithRed:116.0/255.0 green:123.0/255.0 blue:204.0/255.0 alpha:1.0]];
////    webResponseDataSet.drawCubicEnabled = YES;
//    
////    webResponseDataSet.colors = @[[UIColor colorWithRed:230.0/255.0 green:126.0/255.0 blue:34.0/255.0 alpha:1.0]];
//    
////    LineChartDataSet *responseDataSet = [[LineChartDataSet alloc] initWithYVals:yValsResponse label:@"Response"];
//    
//    
//    // Add all data sets to dataSet array
//    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
//    [dataSets addObject:webResponseDataSet];
////    [dataSets addObject:responseDataSet];
//    
//    
//    // Generate line chart data object
//    LineChartData *lineChartData = [[LineChartData alloc] initWithXVals:xVals dataSets:dataSets];
//    [lineChartData setDrawValues:NO];
//
//
//    
//    // Associate line chart data to chart object
//    self.chartView.data = lineChartData;
//    
//    
//    // Style the chart object
//    self.chartView.xAxis.labelPosition = ChartLimitLabelPositionRight;
//    [self.chartView setDrawBordersEnabled:YES];
//    self.chartView.borderColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.35];
//    [self.chartView setDrawGridBackgroundEnabled:NO];
//    [self.chartView setDragEnabled:NO];
//    [self.chartView setHighlightEnabled:NO];
//    self.chartView.descriptionText = @"";
//    [self.chartView setScaleEnabled:YES];
//    self.chartView.pinchZoomEnabled = YES;
//
//    
//    // Syle some moew
//    ChartYAxis *rightYAxis = self.chartView.rightAxis;
//    [rightYAxis setDrawLabelsEnabled:NO];
//    [rightYAxis setDrawAxisLineEnabled:NO];
//    rightYAxis.startAtZeroEnabled = NO;
//    rightYAxis.gridColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.1];
//    
//    ChartYAxis *leftYAxis = self.chartView.leftAxis;
//    [leftYAxis setDrawLabelsEnabled:YES];
//    [leftYAxis setDrawAxisLineEnabled:NO];
//    [leftYAxis setDrawGridLinesEnabled:NO];
//    leftYAxis.startAtZeroEnabled = NO;
//    leftYAxis.labelPosition = ChartLimitLabelPositionLeft;
//    
//
//    ChartXAxis *xAxis = self.chartView.xAxis;
//    [xAxis setDrawGridLinesEnabled:NO];
//    [xAxis setDrawAxisLineEnabled:NO];
//    
    

}

@end
