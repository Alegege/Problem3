//
//  VEHtmlElementListViewController.m
//  Problem3
//
//  Created by Alejandro Garcia on 1/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "VEHtmlElementListViewController.h"

@interface VEHtmlElementListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, assign) VEHtmlElementType htmlElementType;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *elements;

@end

@implementation VEHtmlElementListViewController

- (id)initWithURL:(NSURL *)url htmlElementType:(VEHtmlElementType)htmlElementType
{
    self = [super init];
    
    if (self) {
        _url = url;
        _htmlElementType = htmlElementType;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self loadElements];
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.estimatedRowHeight = 100;
    tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    @weakify(self)
    [RACObserve(self, elements) subscribeNext:^(id x) {
        [tableView reloadData];
        
        [self_weak_ hideLoadingHUD];
    }];
}

- (void)loadElements
{
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.elements.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UITableViewDelegate



@end
