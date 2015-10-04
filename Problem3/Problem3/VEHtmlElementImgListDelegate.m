//
//  VEHtmlElementImgListBaseDelegate.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElementImgListDelegate.h"

@interface VEHtmlElementImgListDelegate () <UITableViewDelegate>

@end

@implementation VEHtmlElementImgListDelegate

- (void)setupDelegate:(UITableView *)tableView
{
    tableView.delegate = self;
}

@end
