//
//  VEHtmlElementListViewController.h
//  Problem3
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VEHtmlElement.h"

/**
 * Displays a list of a[href] html elements
 */
@interface VEHtmlElementListViewController : VEViewController

/**
 * Designated initializer
 */
- (id)initWithURL:(NSURL *)url htmlElementType:(VEHtmlElementType)htmlElementType;

@end
