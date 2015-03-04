//
//  CustomCollectionViewCell.m
//  CustomCell
//
//  Created by Marty Burolla on 3/2/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "Masonry.h"
#import "ChordUIView.h"

@interface CustomCollectionViewCell()
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) ChordUIView* chordView;
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
        self.backgroundColor = [UIColor grayColor];
        [self setUpUserInterface];
        [self setUpConstraints];
    }
    return self;
}

#pragma mark - User Interface

-(void)setUpUserInterface
{
    [self setUpLabel];
    [self setUpProgressBar];
    [self setUpChord];
}

- (void)setUpChord
{
    _chordView = [[ChordUIView alloc]init];
    _chordView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview: _chordView];
}

- (void)setUpLabel
{
    _label = [[UILabel alloc]init];
    _label.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview: _label];
}

- (void)setUpProgressBar
{
    _progressView = [[UIProgressView alloc] init];
    _progressView.trackTintColor = [UIColor blackColor];
    _progressView.tintColor = [UIColor greenColor];
    [self simulateWork];
    
    [self.contentView addSubview: _progressView];
}

#pragma mark - Constraints

- (void)setUpConstraints
{
    [self setUpConstraintsForLabel];
    [self setUpConstraintsForProgressBar];
    [self setUpConstraintsForChord];
}

- (void)setUpConstraintsForChord
{
    [_chordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(10);
        make.leading.equalTo(self.mas_leading).with.offset(20);
        make.trailing.equalTo(self.mas_trailing).with.offset(-20);
        make.height.equalTo(@(60));
    }];
}

- (void)setUpConstraintsForLabel
{
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-5);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@20);
    }];
}

- (void)setUpConstraintsForProgressBar
{
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.leading.equalTo(self.mas_leading);
        make.trailing.equalTo(self.mas_trailing);
        make.height.equalTo(@(3));
    }];
}

#pragma mark - Simulate work

-(void)simulateWork
{
    for(int i = 1; i < 100; i++)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, i/10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [_progressView setProgress: i/100.0];
        });
    }
}

@end
