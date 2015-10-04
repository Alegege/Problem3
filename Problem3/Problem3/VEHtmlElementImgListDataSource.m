//
//  VEHtmlElementImgListBaseDataSource.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElementImgListDataSource.h"
#import "VEHtmlElementViewModel.h"
#import "VEHtmlElementImgSrc.h"
#import "VEHtmlElementImgCell.h"

@interface VEHtmlElementImgListDataSource () <UITableViewDataSource>

@end

@implementation VEHtmlElementImgListDataSource

- (void)setupDataSource:(UITableView *)tableView
{
    [tableView registerNib:[UINib nibWithNibName:@"VEHtmlElementImgCell" bundle:nil] forCellReuseIdentifier:@"imgCell"];
    
    tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.elements.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"imgCell";
    
    VEHtmlElementImgCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    [cell setupCellWithHtmlElementImg:self.viewModel.elements[indexPath.row]];
    
    return cell;
}

@end
