//
//  CPSyntheticChartCell.h
//  Catchpoint
//
//  Created by Matias on 7/2/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Charts;

@interface CPSyntheticChartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet LineChartView *chartView;

@end
