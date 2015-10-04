//
//  VEHtmlElementViewModel.h
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElement.h"
#import "VEHtmlElementListBaseDelegate.h"
#import "VEHtmlElementListBaseDataSource.h"

@interface VEHtmlElementViewModel : NSObject

@property (nonatomic, copy, readonly) NSArray *elements;

- (id)initWithUrl:(NSURL *)url htmlElementType:(VEHtmlElementType)htmlElementType;

- (void)loadWebsite;

- (VEHtmlElementListBaseDelegate *)delegate;

- (VEHtmlElementListBaseDataSource *)dataSource;

@end
