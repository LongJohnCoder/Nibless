//
//  CustomCell.m
//  CustomCell
//
//  Created by Marty Burolla on 2/26/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "CustomCell.h"
#import "Masonry.h"

@interface CustomCell()
@end

@implementation CustomCell

+ (NSString*)identifier
{
    return NSStringFromClass([CustomCell class]);
}

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
    _customUIView = [[CustomViewUIView alloc] init];
    _customUIView.mas_key = @"customUIView";
    [self addSubview: _customUIView];
}

#pragma mark - Constraints

- (void)setUpConstraints
{
    [self.customUIView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.mas_height);
        make.leading.equalTo(self.mas_leading);
        make.trailing.equalTo(self.mas_trailing);
    }];
}


@end


