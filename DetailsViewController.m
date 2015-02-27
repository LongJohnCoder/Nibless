//
//  DetailsViewController.m
//  CustomCell
//
//  Created by Marty Burolla on 2/27/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIColor+MyColors.h"
#import "Masonry.h"

@implementation DetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setUpUserInterface];
    [self setUpConstraints];
}

#pragma mark - Setup UI

-(void)setUpUserInterface
{
    _label = [[UILabel alloc]init];
    _label.text = @"test";
    _label.backgroundColor = [UIColor redColor];
    
    [self.view addSubview: _label];
}

#pragma mark - Setup Constraints

-(void)setUpConstraints
{
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(65);
    }];
}


@end
