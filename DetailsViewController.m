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
#import "ViewForScrollView.h"

const int kHeightOfNavbar = 65;

@interface DetailsViewController() <UICollectionViewDataSource,
                                    UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) NSArray* dataToDisplay;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UISlider* slider;
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
    [self setUpScrollView];
    [self setUpSlider];
    [self setUpActivityIndicator];
}

-(void)setUpSlider
{
    _slider = [[UISlider alloc]init];
    _slider.value = .5;
    
    [_slider addTarget:self action:@selector(sliderChanged) forControlEvents:UIControlEventAllEvents];
    [self.view addSubview: _slider];
}

- (void)setUpScrollView
{
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.contentSize = CGSizeMake(1000, 100); 
    _scrollView.showsHorizontalScrollIndicator = YES;
 
    ViewForScrollView *view = [[ViewForScrollView alloc]init];
    view.backgroundColor = [UIColor redColor];
    [_scrollView addSubview: view];
    [self.view addSubview: _scrollView];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollView.mas_top);
        make.height.equalTo(@100);
    }];
}

- (void)setUpPageControl
{
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.backgroundColor = [UIColor blackColor];
    _pageControl.numberOfPages = 2;
    _pageControl.currentPage = 0;
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventAllEvents];
    
    [self.view addSubview: _pageControl];
}

- (void)changePage:(id)sender
{
    
}

- (void)setUpActivityIndicator
{
    _activityIndicator = [[UIActivityIndicatorView alloc] init];
    _activityIndicator.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _activityIndicator.color = [UIColor blackColor];
    [_activityIndicator startAnimating];
    
    [self.view addSubview: _activityIndicator];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        [_activityIndicator stopAnimating];
        
        /*
        [UIView animateWithDuration: 5
                              delay: 1
             usingSpringWithDamping: 1
              initialSpringVelocity: 1
                            options: UIViewAnimationCurveLinear | UIViewAnimationCurveEaseOut
                         animations:^{
                            _activityIndicator.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
                         }
                         completion:^(BOOL finished) {
                             _activityIndicator.backgroundColor = [UIColor clearColor];
                            [_activityIndicator stopAnimating];
                         }];
         */
    });
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
    [self setUpConstraintsForActivityIndicator];
    //[self setUpConstraintsForPageControl];
    [self setUpConstraintsForScrollView];
    [self setupConstraintsForSlider];
}

-(void)setupConstraintsForSlider
{
    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
    }];
}

- (void)setUpConstraintsForScrollView
{
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).with.offset(30);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)setUpConstraintsForActivityIndicator
{
    [_activityIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
        make.center.equalTo(self.view);
    }];
}

- (void)setUpConstraintsForPageControl
{
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(200));
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
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
    [self.activityIndicator stopAnimating];
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

-(void)sliderChanged
{
     NSLog(@"Slider value = %f", _slider.value);
}

@end








