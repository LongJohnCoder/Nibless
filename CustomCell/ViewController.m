//
//  ViewController.m
//  CustomCell
//
//  Created by Marty Burolla on 2/26/15.
//  Copyright (c) 2015 Marty Burolla. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CustomCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *tableData;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableData = @[ @"one", @"two", @"three"];
    
    [self setUpTable];
    [self setUpConstraints];
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier: [CustomCell identifier]];
    cell.customUIView.label.text = self.tableData[indexPath.row];
    
    return cell;
}

#pragma mark - Setup Table

- (void)setUpTable
{
    _tableView = [[UITableView alloc]init];
    [_tableView registerClass: [CustomCell class] forCellReuseIdentifier: [CustomCell identifier]];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.mas_key = @"tableView";
   
    
    [self.view addSubview: _tableView];
}

#pragma mark - Setup Constraints

- (void)setUpConstraints
{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(20);
        make.bottom.equalTo(self.view.mas_bottom);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
    }];
}


@end














