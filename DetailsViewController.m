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
#import "CustomCollectionViewCell.h"

const int kHeightOfNavbar = 65;

@interface DetailsViewController() <UICollectionViewDataSource,
                                    UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) NSArray* dataToDisplay;
@end

@implementation DetailsViewController

#pragma mark - Lifecycle

- (instancetype)init
{    
    self = [super init];
    if (self!=nil) {
        [self setUpUserInterface];
        [self setUpConstraints];
        
        _dataToDisplay = @[@"ONE", @"TWO", @"THREE", @"FOUR", @"FIVE", @"SIX", @"SEVEN", @"EIGHT", @"NINE", @"TEN"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - Setup UI

-(void)setUpUserInterface
{
    [self setUpLabel];
    [self setUpCollectionView];
}

- (void)setUpLabel
{
    _label = [[UILabel alloc]init];
    _label.backgroundColor = [UIColor redColor];
    
    [self.view addSubview: _label];
}

- (void)setUpCollectionView
{
    UICollectionViewFlowLayout *aFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    aFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //aFlowLayout.itemSize = CGSizeMake(100, 100);                 // Sized by UICollectionViewDelegateFlowLayout
    //aFlowLayout.minimumLineSpacing = 2;                          // Sized by UICollectionViewDelegateFlowLayout
    //aFlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); // Sized by UICollectionViewDelegateFlowLayout
 
    _collectionView = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout: aFlowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier: [CustomCollectionViewCell identifier]];
    
    [self.view addSubview: _collectionView];
}

#pragma mark - Setup Constraints

-(void)setUpConstraints
{
    [self setUpConstraintsForLabel];
    [self setUpConstraintsForCollectionView];
}

- (void)setUpConstraintsForLabel
{
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(kHeightOfNavbar);
    }];
}

- (void)setUpConstraintsForCollectionView
{
   [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.label.mas_bottom);
       make.leading.equalTo(self.view.mas_leading);
       make.trailing.equalTo(self.view.mas_trailing);
       make.height.equalTo(@300);
   }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataToDisplay.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: [CustomCollectionViewCell identifier] forIndexPath:indexPath];
    cell.label.text = _dataToDisplay[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog( @"Selected %ld", (long)indexPath.row);
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100,100);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end








