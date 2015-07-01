//
//  TestsTableViewController.m
//  Catchpoint
//
//  Created by Matias on 6/30/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "DataUtils.h"

#import "TestsTableViewController.h"

@interface TestsTableViewController()

@property (nonatomic, strong) NSArray *tests;
@property (nonatomic, strong) NSDictionary *products;

@end

@implementation TestsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tests = [CPAPIRequest getAllTests];
    
    
    
    NSArray *productData = [CPAPIRequest getAllProducts];
    self.products = [CPAPIParser getAllProductsForData:productData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CPCell" forIndexPath:indexPath];
    
    NSString *testName = [NSString stringWithFormat:@"%@", self.tests[indexPath.row][@"name"]];
    NSString *productID = [NSString stringWithFormat:@"%@", self.tests[indexPath.row][@"product_id"]];
    
    NSString *productName = [self.products objectForKey:productID];
    
    cell.textLabel.text = testName;
    cell.detailTextLabel.text = productName;
    
    return cell;
}


@end
