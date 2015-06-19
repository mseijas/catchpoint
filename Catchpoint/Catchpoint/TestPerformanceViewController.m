//
//  TestPerformanceViewController.m
//  Catchpoint
//
//  Created by Matias on 6/18/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <FSLineChart.h>
#import "CPAPIManager.h"
#import "TimeUtils.h"

#import "TestPerformanceViewController.h"


@interface TestPerformanceViewController ()


@property (weak, nonatomic) IBOutlet UIView *chartView;
@property (strong, nonatomic) FSLineChart *chart;
@property (weak, nonatomic) NSArray *data;
@property (weak, nonatomic) NSString *testName;

@end

@implementation TestPerformanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.data = [self getDataForTest:@"33621"];
    
    
    [self.view addGestureRecognizer:
     [[UITapGestureRecognizer alloc] initWithTarget:self
                                             action:@selector(hideKeyboard:)]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    FSLineChart *chart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 260, [UIScreen mainScreen].bounds.size.width - 40, 166)];
    
    self.chart = chart;
    
    [self.chartView addSubview:self.chart];
//    [self.chart addSubview:chart];
    
    [self updateChart];
}

- (IBAction)hideKeyboard:(id)sender {
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drawChart:(id)sender {
    NSLog(@"Drawing chart");
    
    [self.view endEditing:YES];
    
    NSString *testId = self.testIdField.text;
    self.data = [self getDataForTest:testId];
    [self.chart clearChartData];
    [self updateChart];
}


- (void)updateChart {
    self.chart.verticalGridStep = 5;
    self.chart.horizontalGridStep = 5;
    
    self.chart.labelForIndex = ^(NSUInteger item) {
        return [TimeUtils formatTime:[TimeUtils utcStringToDate:self.data[item][@"dimension"][@"name"]]];
    };
    
    self.chart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };
    
    NSArray *chartData = [self chartDataForMetric:17];
    
    [self.chart setChartData:chartData];
}

- (NSDictionary *)getRawDataForTest:(NSString *)testId {
    
    NSString *requestURI = [NSString stringWithFormat:@"https://io.catchpoint.com/ui/api/v1/performance/raw?tests=%@", testId];
    
    NSLog(@"Request URI: %@", requestURI);
    
    NSDictionary *rawData = [CPAPIManager GET:requestURI];
    
    return rawData;
}

- (NSArray *)getDataForTest:(NSString *)testId {
    NSLog(@"Geting data for test %@", testId);
    
    NSDictionary *rawData = [self getRawDataForTest:testId];
    
    NSArray *items = rawData[@"detail"][@"items"];
    
    self.testName = rawData[@"detail"][@"items"][0][@"breakdown_1"][@"name"];
    self.testLabel.text = self.testName;
    
    return items;
}

- (NSArray *)chartDataForMetric:(int)metricId {
    NSMutableArray *chartData = [[NSMutableArray alloc] init];
    
    for (int i=0; i < self.data.count; i++) {
        NSString *metricValString = self.data[i][@"synthetic_metrics"][metricId];
        double metricValue = [metricValString doubleValue];
        
        NSLog(@"Metric %i: %.0f", metricId, metricValue);
        
        NSNumber *value = [NSNumber numberWithDouble:metricValue];
        
        [chartData addObject:value];
    }
    
    return chartData;
}



@end
