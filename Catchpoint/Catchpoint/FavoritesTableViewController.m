//
//  FavoritesTableViewController.m
//  Catchpoint
//
//  Created by Matias on 7/2/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIParser.h"
#import "CPAPIRequest.h"
#import "SVProgressHUD.h"

#import "FavoritesTableViewController.h"
#import "CPSyntheticFavoriteTableViewCell.h"
#import "CPSyntheticTestCell.h"
#import "TestPerformanceViewController.h"

@interface FavoritesTableViewController ()

@property (strong, nonatomic) NSMutableDictionary *testData;

//@property (nonatomic) int selectedTestID;
@property (strong, nonatomic) NSMutableArray *selectedTestData;

@end

@implementation FavoritesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectedTests = [[NSArray alloc] init];
    self.testData = [[NSMutableDictionary alloc] init];
    self.selectedTestData = [[NSMutableArray alloc] init];
    
    [self loadTestData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CPSyntheticFavoriteTableViewCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CPSyntheticFavoriteTableViewCell"];
    
    [self.tableView reloadData];
}

- (IBAction)unwindToFavorites:(UIStoryboardSegue *)segue {
    //NSLog(@"unwindToFavorites");
    //NSLog(@"Selected tests: %@", self.selectedTests);
    [self loadTestData];
    [self.tableView reloadData];
}

- (IBAction)refreshTestData:(id)sender {
    [self loadTestData];
    [self.tableView reloadData];
}

- (IBAction)addFavorites:(id)sender {
    [SVProgressHUD show];
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self performSegueWithIdentifier:@"addFavorites" sender:sender];
    });
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTestPerformance"]) {

        if ([segue.destinationViewController isKindOfClass:[TestPerformanceViewController class]]) {
            TestPerformanceViewController *testPerformanceViewController = segue.destinationViewController;
            
            int testID = (int)self.selectedTestData[0][@"id"];
            
            [self.selectedTestData addObject:[self.testData objectForKey:[NSNumber numberWithInt:testID]]];
//            NSArray *selectedTestData = [self.testData objectForKey:[NSNumber numberWithInt:testID]];
            testPerformanceViewController.testData = self.selectedTestData;
        }
    }
}

- (void)loadTestData {
    [SVProgressHUD show];
    dispatch_async(dispatch_get_main_queue(), ^ {
    NSString *testIDs;
    
    if (self.selectedTests.count > 0) {
        for (int i=0; i < self.selectedTests.count; i++) {
            if (i == 0) {
                testIDs = [NSString stringWithFormat:@"%@", self.selectedTests[i][@"id"]];
            }
            else {
                testIDs = [NSString stringWithFormat:@"%@,%@", testIDs, self.selectedTests[i][@"id"]];
            }
        }
    }
    
    if (testIDs) {
        NSArray *testData = [CPAPIRequest getPerformanceForTest:testIDs raw:NO];
        //NSLog(@"TestData: %@", testData);
        
        for (int i=0 ; i < self.selectedTests.count ; i++) {
            
            int currentTest = (int)self.selectedTests[i][@"id"];
            NSMutableArray *currentTestData = [[NSMutableArray alloc] init];
        
            for (int j=0 ; j < testData.count ; j++) {
                int testID = (int)testData[j][@"breakdown_1"][@"id"];
                
                if (testID == currentTest) {
                    NSDictionary *currentData = testData[j];
                    [currentTestData addObject:currentData];
                }
            }
            
            [self.testData setObject:currentTestData forKey:[NSNumber numberWithInt:currentTest]];
        }
    }
    
//    NSLog(@"CURRENT TEST DATA: %@", self.testData);
    [SVProgressHUD dismiss];
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.selectedTests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSLog(@"Processing cell...");
    
    static NSString *CellIdentifier = @"CPSyntheticFavoriteTableViewCell";
    
    CPSyntheticFavoriteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.test = self.selectedTests[indexPath.row];
    
    int testID = (int)self.selectedTests[indexPath.row][@"id"];
    NSString *testName = [NSString stringWithFormat:@"%@", self.selectedTests[indexPath.row][@"name"]];
    NSString *testType = [NSString stringWithFormat:@"%@", self.selectedTests[indexPath.row][@"type"][@"name"]];
    NSString *productName = [NSString stringWithFormat:@"%@", self.selectedTests[indexPath.row][@"product_name"]];
    
    //NSLog(@"Test Name: %@", testName);
    
    cell.testID = testID;
    cell.testName.text = testName;
    cell.productName.text = productName;
    cell.testType.text = testType;
    cell.testType.backgroundColor = [CPAPIParser colorForTestTypeID:self.selectedTests[indexPath.row][@"type"][@"id"]];
    
    
    NSArray *testData = [self.testData objectForKey:[NSNumber numberWithInt:testID]];
    NSNumber *responseAvg = [CPAPIParser getMetric:SyntheticMetricResponse fromSyntheticData:testData average:YES];
    NSNumber *availabilityAvg = [CPAPIParser getMetric:SyntheticMetricPctAvailability fromSyntheticData:testData average:YES];

    cell.responseMetric.text = [NSString stringWithFormat:@"%.2f", [responseAvg doubleValue]];
    cell.availabilityMetric.text = [NSString stringWithFormat:@"%.2f", [availabilityAvg doubleValue]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [SVProgressHUD show];

    dispatch_async(dispatch_get_main_queue(), ^ {
        [self.selectedTestData removeAllObjects];
        [self.selectedTestData addObject:self.selectedTests[indexPath.row]];
        
        [self performSegueWithIdentifier:@"showTestPerformance" sender:self];
    });
    
    
}

@end
