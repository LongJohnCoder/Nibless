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
#import "DetailsViewController.h"
#import "WebViewViewController.h"
#import "PopoverViewController.h"

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
    
    [self setUpNavigationBar];

}

-(void)barButtonDone
{
    WebViewViewController *webViewViewController = [[WebViewViewController alloc] init];
    [self.navigationController pushViewController:webViewViewController animated:YES];
}

-(void)popOver
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        PopoverViewController* pvc = [[PopoverViewController alloc]init];
        UIPopoverController* popOverController = [[UIPopoverController alloc] initWithContentViewController: pvc];
        popOverController.popoverContentSize = CGSizeMake(100, 100);
        [popOverController presentPopoverFromRect: CGRectMake(0, 0, 100, 100) inView: self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else{
        NSLog(@"Not an iPad.");
    }
 
    /*
    NewViewController *newViewController = [[NewViewController alloc] initWithNibName:@"NewViewController" bundle:nil];
    popoverController = [[UIPopoverController alloc] initWithContentViewController:newViewController];
    popoverController.popoverContentSize = CGSizeMake(320.0, 400.0);
    [popoverController presentPopoverFromRect:[(UIButton *)sender frame]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
     */
}

#pragma mark - Navigation Item

-(void)setUpNavigationBar
{
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]
                                    initWithTitle: @"WebView"
                                    style:UIBarButtonItemStyleDone
                                    target: self
                                    action: @selector(barButtonDone)];
    
    UIBarButtonItem *rightButton2 = [[UIBarButtonItem alloc]
                                     initWithTitle: @"Popover"
                                     style:UIBarButtonItemStyleDone
                                     target: self
                                     action: @selector(popOver)];
    
    NSArray *arrBtns = [[NSArray alloc]initWithObjects: rightButton,rightButton2, nil];
    
    self.navigationItem.title = @"Nibless";
    self.navigationItem.rightBarButtonItems = arrBtns;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController *dvc = [[DetailsViewController alloc] init];
    dvc.label.text = self.tableData[indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
    
    NSLog(@"Selected: %ld", (long)indexPath.row);
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
    _tableView.layoutMargins = UIEdgeInsetsZero;
    _tableView.separatorInset = UIEdgeInsetsZero;
    
    [self.view addSubview: _tableView];
}

#pragma mark - Setup Constraints

- (void)setUpConstraints
{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
    }];
}


@end














