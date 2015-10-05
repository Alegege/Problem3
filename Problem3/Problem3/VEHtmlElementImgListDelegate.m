//
//  VEHtmlElementImgListBaseDelegate.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElementImgListDelegate.h"
#import "VEHtmlElementImgCell.h"

@interface VEHtmlElementImgListDelegate () <UITableViewDelegate>

@end

@implementation VEHtmlElementImgListDelegate

- (void)setupDelegate:(UITableView *)tableView
{
    tableView.delegate = self;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [VEHtmlElementImgCell preferredHeight];
}

@end
