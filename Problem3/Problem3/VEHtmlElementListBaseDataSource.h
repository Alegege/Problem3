//
//  VEHtmlElementListBaseDataSource.h
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VEHtmlElementViewModel;

@interface VEHtmlElementListBaseDataSource : NSObject

@property (nonatomic, strong, readonly) VEHtmlElementViewModel *viewModel;

- (id)initWithViewModel:(VEHtmlElementViewModel *)viewModel;

- (void)setupDataSource:(UITableView *)tableView;

@end
