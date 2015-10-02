//
//  VEHtmlElementListViewController.h
//  Problem3
//
//  Created by Alejandro Garcia on 1/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VEHtmlElementType) {
    HtmlElementTypeA,
};

@interface VEHtmlElementListViewController : VEViewController

- (id)initWithURL:(NSURL *)url htmlElementType:(VEHtmlElementType)htmlElementType;

@end
