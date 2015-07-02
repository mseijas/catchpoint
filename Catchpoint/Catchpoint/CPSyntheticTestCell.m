//
//  CPSyntheticTestCell.m
//  Catchpoint
//
//  Created by Matias on 7/1/15.
//  Copyright (c) 2015 Catchpoint Systems. All rights reserved.
//

#import "CPSyntheticTestCell.h"

@interface CPSyntheticTestCell ()

@property (strong, nonatomic) IBOutlet UIView *testContentView;

@end


@implementation CPSyntheticTestCell

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
        self.checkbox.image = [UIImage imageNamed:@"checkboxOn"];
    }
    else {
        self.testContentView.layer.backgroundColor = [UIColor colorWithRed:213.0 / 255.0 green:213.0 / 255.0 blue:213.0 / 255.0 alpha:1.0].CGColor;
        [UIView animateWithDuration:0.4 animations:^{
            [self setCellStyle];
        }];
        self.checkbox.image = [UIImage imageNamed:@"checkboxOff"];
    }
}


- (void)setCellStyle {
    self.testType.layer.cornerRadius = 2.0;
    self.testType.clipsToBounds = YES;
    self.testContentView.layer.cornerRadius = 5.0;
    self.testContentView.layer.borderWidth = 1.0;
    self.testContentView.layer.borderColor = [UIColor colorWithRed:214.0 / 255.0 green:214.0 / 255.0 blue:214.0 / 255.0 alpha:1.0].CGColor;
    self.testContentView.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor clearColor];
}

@end
