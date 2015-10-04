//
//  HtmlElementImgSrc.h
//  Problem3
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElement.h"

/**
 * This model class represents an html img[src] element
 */
@interface VEHtmlElementImgSrc : VEHtmlElement

/** Title attribute of the image */
@property (nonatomic, copy) NSString *title;

/** Src attribute of the image */
@property (nonatomic, copy) NSString *src;

@end
