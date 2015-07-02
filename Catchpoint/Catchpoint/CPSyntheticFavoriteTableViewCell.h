//
//  CPSyntheticFavoriteTableViewCell.h
//  Catchpoint
//
//  Created by Matias on 7/2/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPSyntheticFavoriteTableViewCell : UITableViewCell

@property (strong, nonatomic) NSDictionary *test;

@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *testName;
@property (weak, nonatomic) IBOutlet UILabel *testType;

@property (weak, nonatomic) IBOutlet UIView *responseView;
@property (weak, nonatomic) IBOutlet UILabel *responseMetric;

@property (weak, nonatomic) IBOutlet UIView *availabilityView;
@property (weak, nonatomic) IBOutlet UILabel *availabilityMetric;

@end
