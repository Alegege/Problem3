//
//  VEHtmlElementListBaseDataSource.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElementListBaseDataSource.h"

@implementation VEHtmlElementListBaseDataSource

- (id)initWithViewModel:(VEHtmlElementViewModel *)viewModel
{
    self = [super init];
    
    if (self) {
        _viewModel = viewModel;
    }
    
    return self;
}

- (void)setupDataSource:(UITableView *)tableView
{
    //To be implemented in child classes
}

@end
