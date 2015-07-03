//
//  CPSyntheticChartCell.m
//  Catchpoint
//
//  Created by Matias on 7/2/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPSyntheticChartCell.h"

@implementation CPSyntheticChartCell

- (void)awakeFromNib {
    [self setCellStyle];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellStyle {
    self.chartView.clipsToBounds = YES;
    self.chartView.layer.cornerRadius = 5.0;
    self.chartView.layer.borderWidth = 1.0;
    self.chartView.layer.borderColor = [UIColor colorWithRed:214.0 / 255.0 green:214.0 / 255.0 blue:214.0 / 255.0 alpha:1.0].CGColor;
    self.chartView.backgroundColor = [UIColor whiteColor];
}
@end
