//
//  CustomViewUIView.m
//  CustomCell
//
//  Created by Marty Burolla on 2/27/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "CustomViewUIView.h"
#import "Masonry.h"

static CGSize kLabelSize = { 100, 20 };

@interface CustomViewUIView()
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UIStepper *stepper;
@end

@implementation CustomViewUIView

#pragma mark - Construction

- (instancetype)init
{    
    self = [super init];
    if (self!=nil) {
        self.backgroundColor = [UIColor grayColor];
        [self setUpUserInterface];
        [self setUpConstraints];
    }
    return self;
}

#pragma mark - Stepper Action

- (void)stepperValueChanged
{
    NSLog(@"Stepper value is: %f", self.stepper.value);
}

#pragma mark - Setup User Interface

- (void)setUpUserInterface
{
    [self setUpLabel];
    [self setUpLabel2];
    [self setUpStepper];
}

- (void)setUpLabel
{
    _label = [[UILabel alloc]init];
    _label.backgroundColor = [UIColor redColor];
    _label.mas_key = @"label";
    [self addSubview: _label];
}

- (void)setUpLabel2
{
    _label2 = [[UILabel alloc]init];
    _label2.text = @"This is the bottom label.";
    _label2.backgroundColor = [UIColor blueColor];
    _label2.mas_key = @"label2";
    [self addSubview: _label2];
}

- (void)setUpStepper
{
    _stepper = [[UIStepper alloc]init];
    _stepper.backgroundColor = [UIColor whiteColor];
    _stepper.mas_key = @"stepper";
    _stepper.minimumValue = 1;
    _stepper.maximumValue = 100;
    _stepper.value = 50;
    _stepper.stepValue = 1;
    [_stepper addTarget: self action: @selector(stepperValueChanged) forControlEvents: UIControlEventTouchUpInside];
    
    [self addSubview: _stepper];
}

#pragma mark - Setup Constraints

- (void)setUpConstraints
{
    [self setUpConstratinsForLabel];
    [self setUpConstraintsForLabel2];
    [self setUpConstraintsForStepper];
}

- (void)setUpConstratinsForLabel
{
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.leading.equalTo(self.mas_leading);
        make.width.equalTo(@(kLabelSize.width));
        make.height.equalTo(@(kLabelSize.height));
    }];
}

- (void)setUpConstraintsForLabel2
{
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (void)setUpConstraintsForStepper
{
    [self.stepper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.mas_trailing).with.offset(-10);
        make.centerY.equalTo(self.mas_centerY);
    }];
}


@end







