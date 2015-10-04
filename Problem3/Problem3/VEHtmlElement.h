//
//  HtmlElement.h
//  Problem3
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VEHtmlElementType) {
    HtmlElementTypeAHref,
    HtmlElementTypeImgSrc,
};

/**
 * Base model class
 */
@interface VEHtmlElement : NSObject

@end
