//
//  VEHtmlElementAListBaseDataSource.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElementAListDataSource.h"
#import "VEHtmlElementViewModel.h"
#import "VEHtmlElementAHref.h"

@interface VEHtmlElementAListDataSource () <UITableViewDataSource>

@end

@implementation VEHtmlElementAListDataSource

- (void)setupDataSource:(UITableView *)tableView
{
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
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    VEHtmlElementAHref *htmlElement = self.viewModel.elements[indexPath.row];
    cell.textLabel.text = htmlElement.title;
    cell.detailTextLabel.text = htmlElement.url;
    
    return cell;
}

@end
