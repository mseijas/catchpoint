//
//  CPSyntheticFavoriteTableViewCell.m
//  Catchpoint
//
//  Created by Matias on 7/2/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPSyntheticFavoriteTableViewCell.h"

@interface CPSyntheticFavoriteTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *testContentView;

@end

@implementation CPSyntheticFavoriteTableViewCell

- (void)awakeFromNib {
    [self setCellStyle];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        self.testContentView.layer.backgroundColor = [UIColor colorWithRed:213.0 / 255.0 green:213.0 / 255.0 blue:213.0 / 255.0 alpha:1.0].CGColor;
        [UIView animateWithDuration:0.4 animations:^{
            [self setCellStyle];
        }];
    } else {
        self.testContentView.layer.backgroundColor = [UIColor colorWithRed:213.0 / 255.0 green:213.0 / 255.0 blue:213.0 / 255.0 alpha:1.0].CGColor;
        [UIView animateWithDuration:0.4 animations:^{
            [self setCellStyle];
        }];
    }
}

- (void)setCellStyle {
    self.testContentView.layer.cornerRadius = 5.0;
    self.testContentView.layer.borderWidth = 1.0;
    self.testContentView.layer.borderColor = [UIColor colorWithRed:214.0 / 255.0 green:214.0 / 255.0 blue:214.0 / 255.0 alpha:1.0].CGColor;
    self.testContentView.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor clearColor];
}

@end
