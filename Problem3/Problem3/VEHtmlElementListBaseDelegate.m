//
//  VEHtmlElementListBaseDelegate.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElementListBaseDelegate.h"

@implementation VEHtmlElementListBaseDelegate

- (id)initWithViewModel:(VEHtmlElementViewModel *)viewModel
{
    self = [super init];
    
    if (self) {
        _viewModel = viewModel;
    }
    
    return self;
}

- (void)setupDelegate:(UITableView *)tableView
{
    //To be implemented in child classes
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
