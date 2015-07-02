//
//  TestPerformanceViewController.m
//  Catchpoint
//
//  Created by Matias on 7/2/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIParser.h"

#import "TestPerformanceViewController.h"
#import "CPSyntheticSummaryCell.h"

@interface TestPerformanceViewController ()

@end

@implementation TestPerformanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSLog(@"TEST DATA: %@", self.testData);
//    [self.tableView registerNib:[UINib nibWithNibName:@"CPSyntheticSummaryCell"
//                                               bundle:[NSBundle mainBundle]]
//         forCellReuseIdentifier:@"CPSyntheticSummaryCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        return 0;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSLog(@"Processing cell...");
    
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
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 115;
    }
    return 44;
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
    
    header.backgroundView.backgroundColor = [UIColor colorWithRed:0.859 green:0.855 blue:0.886 alpha:1];
    header.textLabel.font = [UIFont systemFontOfSize:14.0f];
    header.textLabel.textColor = [UIColor colorWithRed:0.490 green:0.478 blue:0.549 alpha:1];
}

@end
