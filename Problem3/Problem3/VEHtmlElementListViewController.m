//
//  VEHtmlElementListViewController.m
//  Problem3
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "VEHtmlElementListViewController.h"
#import "VEHtmlElementListBaseDelegate.h"
#import "VEHtmlElementListBaseDataSource.h"
#import "VEHtmlElementViewModel.h"

@interface VEHtmlElementListViewController ()

@property (nonatomic, strong) VEHtmlElementViewModel *viewModel;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) VEHtmlElementListBaseDataSource *dataSource;

@property (nonatomic, strong) VEHtmlElementListBaseDelegate *delegate;

@end

@implementation VEHtmlElementListViewController

- (id)initWithURL:(NSURL *)url htmlElementType:(VEHtmlElementType)htmlElementType
{
    self = [super init];
    
    if (self) {
        _viewModel = [[VEHtmlElementViewModel alloc] initWithUrl:url htmlElementType:htmlElementType];
        _delegate = [_viewModel delegate];
        _dataSource = [_viewModel dataSource];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self setupSignals];
    
    [self loadWebsite];
}

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:self.tableView];
    
    [self.delegate setupDelegate:self.tableView];
    [self.dataSource setupDataSource:self.tableView];
}

- (void)setupSignals
{
    @weakify(self)
    [RACObserve(self.viewModel, elements) subscribeNext:^(id x) {
        if (self_weak_.viewModel.elements.count) {
            [self_weak_.tableView reloadData];
            
            [self_weak_ hideLoadingHUD];
        } else if (self_weak_.viewModel.elements) {
            [self_weak_ hideLoadingHUD];
            
            [self_weak_ showNoInfoToDisplayAlert];
        }
    }];
}

- (void)loadWebsite
{
    [self showLoadingHUD];
    
    [self.viewModel loadWebsite];
}

- (void)showNoInfoToDisplayAlert
{
    @weakify(self)
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Information",nil)
                                                                   message:NSLocalizedString(@"There is no info to display (check if the provided URL exists)",nil)
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Accept",nil)
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [self_weak_.navigationController popViewControllerAnimated:YES];
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
