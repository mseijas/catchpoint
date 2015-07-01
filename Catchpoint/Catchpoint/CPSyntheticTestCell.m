//
//  CPSyntheticTestCell.m
//  Catchpoint
//
//  Created by Matias on 7/1/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPSyntheticTestCell.h"

@implementation CPSyntheticTestCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.checkbox.image = [UIImage imageNamed:@"checkboxOn"];
}

@end
