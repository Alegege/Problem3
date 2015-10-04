//
//  VEHtmlElementAListBaseDelegate.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElementAListDelegate.h"

@interface VEHtmlElementAListDelegate () <UITableViewDelegate>

@end

@implementation VEHtmlElementAListDelegate

- (void)setupDelegate:(UITableView *)tableView
{
    tableView.delegate = self;
}

@end
