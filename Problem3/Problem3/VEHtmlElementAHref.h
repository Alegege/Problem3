//
//  HtmlElementAHref.h
//  Problem3
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEHtmlElement.h"

/**
 * This model class represents an html a[href] element
 */
@interface VEHtmlElementAHref : VEHtmlElement

/** Visible title for the user in the website (not 'title' attribute) */
@property (nonatomic, copy) NSString *title;

/** Href attribute */
@property (nonatomic, copy) NSString *url;

@end
