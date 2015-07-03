//
//  SyntheticTestsViewController.m
//  Catchpoint
//
//  Created by Matias on 7/1/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPAPIParser.h"
#import "CPAPIRequest.h"
#import "DataUtils.h"
#import "SVProgressHUD.h"

#import "SyntheticTestsViewController.h"
#import "CPSyntheticTestCell.h"
#import "FavoritesTableViewController.h"

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
    
    self.selectedTests = self.favoriteTests;
    if (!self.selectedTests) {
        self.selectedTests = [[NSMutableArray alloc] init];
    }
    
    [self.view addGestureRecognizer:
     [[UITapGestureRecognizer alloc] initWithTarget:self
                                             action:@selector(hideKeyboard:)]];
    
    self.allTests = [CPAPIParser getAllActiveTests];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CPSyntheticTestCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CPSyntheticTestCell"];
    
    [self updateSelectionCount];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [SVProgressHUD dismiss];
    
//    NSLog(@"SELECTED TESTS: %@", self.selectedTests);

    [self updateSelectionCount];

}

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)applySelectedTests:(id)sender {
    //NSLog(@"-applySelectedTests");
    [SVProgressHUD show];
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self performSegueWithIdentifier:@"unwindToFavoritesWithTests" sender:self];
    });
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"unwindToFavoritesWithTests"]) {
        //NSLog(@"Segue identifier : unwindToFavoritesWithTests");
    if ([segue.destinationViewController isKindOfClass:[FavoritesTableViewController class]]) {
        //NSLog(@"Destination controler isOfClass FavoritesTableViewController");
        FavoritesTableViewController *favoritesTableViewController = segue.destinationViewController;
        favoritesTableViewController.selectedTests = self.selectedTests;
        //NSLog(@"Set selection as: %@", self.selectedTests);
    }
    }
}

- (void)updateSelectionCount {
    self.itemsSelected.title = [NSString stringWithFormat:@"%lu items selected", (unsigned long)self.selectedTests.count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allTests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"Processing cell...");
    
    static NSString *CellIdentifier = @"CPSyntheticTestCell";
    
    CPSyntheticTestCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.test = self.allTests[indexPath.row];
    
    NSString *testName = [NSString stringWithFormat:@"%@", self.allTests[indexPath.row][@"name"]];
    NSString *testType = [NSString stringWithFormat:@"%@", self.allTests[indexPath.row][@"type"][@"name"]];
    NSString *productName = [NSString stringWithFormat:@"%@", self.allTests[indexPath.row][@"product_name"]];
    
    cell.testName.text = testName;
    cell.productName.text = productName;
    cell.testType.text = testType;
    cell.testType.backgroundColor = [CPAPIParser colorForTestTypeID:self.allTests[indexPath.row][@"type"][@"id"]];
    
    if ([self.selectedTests containsObject:cell.test]) {
        [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    
//    NSLog(@"SELECTED: %i", self.selectedTests.count);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CPSyntheticTestCell *cell = (CPSyntheticTestCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self.selectedTests addObject:cell.test];
    [self updateSelectionCount];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    CPSyntheticTestCell *cell = (CPSyntheticTestCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self.selectedTests removeObject:cell.test];
    [self updateSelectionCount];
}

@end
