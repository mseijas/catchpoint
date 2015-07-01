//
//  CPSyntheticTestCell.h
//  Catchpoint
//
//  Created by Matias on 7/1/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPSyntheticTestCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *checkbox;

@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *testName;
@property (weak, nonatomic) IBOutlet UILabel *testType;


@end
