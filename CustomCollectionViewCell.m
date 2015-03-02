//
//  CustomCollectionViewCell.m
//  CustomCell
//
//  Created by Marty Burolla on 3/2/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "Masonry.h"

@interface CustomCollectionViewCell()
@end

@implementation CustomCollectionViewCell

+ (NSString*)identifier
{
    return NSStringFromClass([CustomCollectionViewCell class]);
}

-(instancetype) initWithFrame:(CGRect)frame
{    
    self = [super initWithFrame:frame];
    if (self!=nil) {
        self.backgroundColor = [UIColor greenColor];
        [self setUpUserInterface];
        [self setUpConstraints];
    }
    return self;
}

#pragma mark - User Interface

-(void)setUpUserInterface
{
    _label = [[UILabel alloc]init];
    _label.backgroundColor = [UIColor whiteColor];
    
    [self addSubview: _label];
}

#pragma mark - Constraints

- (void)setUpConstraints
{
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@20);
    }];
}


@end
