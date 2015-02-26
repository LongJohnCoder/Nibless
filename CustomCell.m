//
//  CustomCell.m
//  CustomCell
//
//  Created by Marty Burolla on 2/26/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "CustomCell.h"
#import "Masonry.h"

@implementation CustomCell

#pragma mark - Action

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - Construction

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self!=nil) {
        [self setUpCell];
        [self setUpConstraints];
    }
    return self;
}

- (void)setUpCell
{
    self.label = [[UILabel alloc] init];
    self.label.backgroundColor = [UIColor redColor];
    self.label.font = [UIFont fontWithName: @"Arial" size:15.0f];
    
    [self addSubview: self.label];
}

#pragma mark - Constraints

- (void)setUpConstraints
{
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.leading.equalTo(self.mas_leading).with.offset(10);
        make.trailing.equalTo(self.mas_trailing).with.offset(-10);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@50);
    }];
}


@end

// Test
