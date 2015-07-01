//
//  CPSyntheticTestCell.h
//  Catchpoint
//
//  Created by Matias on 7/1/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPSyntheticTestCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *checkbox;

@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UILabel *testName;
@property (strong, nonatomic) IBOutlet UILabel *testType;


@end
