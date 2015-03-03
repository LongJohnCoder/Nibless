//
//  ViewForScrollView.m
//  CustomCell
//
//  Created by Marty Burolla on 3/3/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "ViewForScrollView.h"
#import "Masonry.h"

@interface ViewForScrollView()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewForScrollView

-(instancetype) init
{    
    self = [super init];
    if (self!=nil) {
        [self setUpUserInterface];
        [self setUpConstraints];
    }
    return self;
}

#pragma mark - Setup

-(void)setUpUserInterface
{
    [self setUpLabel];
}

-(void)setUpLabel
{
    _label = [[UILabel alloc]init];
    _label.backgroundColor = [UIColor yellowColor];
    _label.text = @"This is a very long text This is a very long text This is a very long textThis is a very long text";
    
    [self addSubview: _label];
}

#pragma mark - Constraints

-(void)setUpConstraints
{
    [self setUpConstraintsForLabel];
}

- (void)setUpConstraintsForLabel
{
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading);
        make.top.equalTo(self.mas_top);
        make.width.equalTo(@(500));
    }];
}

@end
