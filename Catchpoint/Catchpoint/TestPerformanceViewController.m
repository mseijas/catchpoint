//
//  TestPerformanceViewController.m
//  Catchpoint
//
//  Created by Matias on 7/2/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIParser.h"
#import "SVProgressHUD.h"

#import "TestPerformanceViewController.h"
#import "CPSyntheticSummaryCell.h"
#import "CPSyntheticChartCell.h"
#import "CPSyntheticChart.h"

@interface TestPerformanceViewController ()

@end

@implementation TestPerformanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSLog(@"TEST DATA: %@", self.testData);
//    [self.tableView registerNib:[UINib nibWithNibName:@"CPSyntheticChartCell"
//                                               bundle:[NSBundle mainBundle]]
//         forCellReuseIdentifier:@"CPSyntheticChartCell"];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [SVProgressHUD dismiss];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 2;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSLog(@"Processing cell...");
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"CPSyntheticSummaryCell";
        
        CPSyntheticSummaryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        //int testID = (int)self.testData[0][@"id"];
        NSString *testName = [NSString stringWithFormat:@"%@", self.testData[0][@"name"]];
        NSString *testType = [NSString stringWithFormat:@"%@", self.testData[0][@"type"][@"name"]];
        NSString *productName = [NSString stringWithFormat:@"%@", self.testData[0][@"product_name"]];
        
        cell.testName.text = testName;
        cell.productName.text = productName;
        cell.testType.text = testType;
        cell.testType.backgroundColor = [CPAPIParser colorForTestTypeID:self.testData[0][@"type"][@"id"]];
        
        
        NSNumber *responseAvg = [CPAPIParser getMetric:SyntheticMetricResponse fromSyntheticData:self.testData[1] average:YES];
        NSNumber *availabilityAvg = [CPAPIParser getMetric:SyntheticMetricPctAvailability fromSyntheticData:self.testData[1] average:YES];
        
        cell.responseMetric.text = [NSString stringWithFormat:@"%.2f", [responseAvg doubleValue]];
        cell.availabilityMetric.text = [NSString stringWithFormat:@"%.2f", [availabilityAvg doubleValue]];
        
        cell.responseMetric.textColor = [UIColor colorWithRed:0.212 green:0.667 blue:0.400 alpha:1];
        cell.availabilityMetric.textColor = [UIColor colorWithRed:0.212 green:0.667 blue:0.400 alpha:1];
        
        if ([responseAvg doubleValue] > 500) {
            cell.responseMetric.textColor = [UIColor colorWithRed:0.949 green:0.604 blue:0.220 alpha:1];
        }
        if ([responseAvg doubleValue] > 1000) {
            cell.responseMetric.textColor = [UIColor colorWithRed:0.894 green:0.310 blue:0.267 alpha:1];
        }
        
        if ([availabilityAvg doubleValue] < 80) {
            cell.availabilityMetric.textColor = [UIColor colorWithRed:0.949 green:0.604 blue:0.220 alpha:1];
        }
        if ([availabilityAvg doubleValue] < 50) {
            cell.availabilityMetric.textColor = [UIColor colorWithRed:0.894 green:0.310 blue:0.267 alpha:1];
        }
        
        return cell;
    }
    
    CPSyntheticChartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CPSyntheticChartCell" forIndexPath:indexPath];
    
    if (indexPath.section == 1) {
        
        NSArray *testData = self.testData[1];
        
        if (indexPath.row == 0) {
        
            NSArray *metrics = [NSArray arrayWithObjects:[NSNumber numberWithInteger:SyntheticMetricResponse],
                                [NSNumber numberWithInteger:SyntheticMetricWebpageResponse],nil];
            
            cell.chart = [CPSyntheticChart initChart:cell.chart withData:testData includeMetrics:metrics];
            cell.chart.leftAxis.startAtZeroEnabled = YES;
            cell.chart.rightAxis.startAtZeroEnabled = YES;
        }
        
        if (indexPath.row == 1) {
            
            cell.chart = [CPSyntheticChart initChart:cell.chart
                                                            withData:testData
                                                      includeMetrics:[NSArray arrayWithObjects:[NSNumber numberWithInteger:SyntheticMetricPctAvailability], nil]];
            
            cell.chart.leftAxis.startAtZeroEnabled = YES;
            cell.chart.rightAxis.startAtZeroEnabled = YES;
        }
        /*
        
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
         
        */
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 114;
        }
    }
    return 258;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @"Last 15 min";
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 35;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    
    header.backgroundView.backgroundColor = [UIColor colorWithRed:0.925 green:0.922 blue:0.949 alpha:1];
    header.textLabel.font = [UIFont systemFontOfSize:14.0f];
    header.textLabel.textColor = [UIColor colorWithRed:0.490 green:0.478 blue:0.549 alpha:1];
}

@end
