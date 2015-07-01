//
//  SyntheticTestsViewController.m
//  Catchpoint
//
//  Created by Matias on 7/1/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIParser.h"
#import "CPAPIRequest.h"

#import "SyntheticTestsViewController.h"
#import "CPSyntheticTestCell.h"

@interface SyntheticTestsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *itemsSelected;

@property (strong, nonatomic) NSArray *allTests;
@property (strong, nonatomic) NSDictionary *allProducts;

@end

@implementation SyntheticTestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allTests = [CPAPIRequest getAllTests];
    
    NSArray *productData = [CPAPIRequest getAllProducts];
    self.allProducts = [CPAPIParser getAllProductsForData:productData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CPSyntheticTestCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CPSyntheticTestCell"];
}

- (IBAction)applySelectedTests:(id)sender {
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allTests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Processing cell...");
    
    static NSString *CellIdentifier = @"CPSyntheticTestCell";
    
    CPSyntheticTestCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *testName = [NSString stringWithFormat:@"%@", self.allTests[indexPath.row][@"name"]];
    NSString *productID = [NSString stringWithFormat:@"%@", self.allTests[indexPath.row][@"product_id"]];
    
    NSString *productName = [self.allProducts objectForKey:productID];
    
    cell.testName.text = testName;
    cell.productName.text = productName;
    
    return cell;
}


@end
