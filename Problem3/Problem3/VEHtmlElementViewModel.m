//
//  VEHtmlElementViewModel.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "VEHtmlElementViewModel.h"

#import "VEHtmlElementListBaseDelegate.h"
#import "VEHtmlElementAListDelegate.h"
#import "VEHtmlElementImgListDelegate.h"

#import "VEHtmlElementListBaseDataSource.h"
#import "VEHtmlElementAListDataSource.h"
#import "VEHtmlElementImgListDataSource.h"

#import "TFHpple.h"
#import "VEHtmlElementAHref.h"
#import "VEHtmlElementImgSrc.h"

@interface VEHtmlElementViewModel ()

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, assign) VEHtmlElementType htmlElementType;

@property (nonatomic, strong) NSData *websiteContent;

@property (nonatomic, copy) NSArray *elements;

@end

@implementation VEHtmlElementViewModel

- (id)initWithUrl:(NSURL *)url htmlElementType:(VEHtmlElementType)htmlElementType
{
    self = [super init];
    
    if (self) {
        _url = url;
        _htmlElementType = htmlElementType;
        
        @weakify(self)
        [RACObserve(self, websiteContent) subscribeNext:^(id x) {
            [self_weak_ loadElements];
        }];
    }
    
    return self;
}

- (void)loadWebsite
{
    @weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        self_weak_.websiteContent = [NSData dataWithContentsOfURL:self.url];
        
        if (!self_weak_.websiteContent) {
            self.elements = [NSArray new];
        }
    });
}

- (void)loadElements
{
    if (self.websiteContent) {
        TFHpple *parser = [TFHpple hppleWithHTMLData:self.websiteContent];
        
        NSString *xpathQueryString = [self xpathQueryString];
        NSArray *nodes = [parser searchWithXPathQuery:xpathQueryString];
        NSMutableArray *newElements = [[NSMutableArray alloc] initWithCapacity:0];
        VEHtmlElement *newElement;
        
        for (TFHppleElement *element in nodes) {
            newElement = [self newHtmlElementWithTFHppleElement:element];
            
            [newElements addObject:newElement];
        }
        
        self.elements = newElements;
    }
}

- (NSString *)xpathQueryString
{
    NSString *xpathQueryString;
    
    switch (self.htmlElementType) {
        case HtmlElementTypeAHref:
            return @"//a";
            
        case HtmlElementTypeImgSrc:
            return @"//img";
    }
    
    return xpathQueryString;
}

- (VEHtmlElement *)newHtmlElementWithTFHppleElement:(TFHppleElement *)hppleElement
{
    switch (self.htmlElementType) {
        case HtmlElementTypeAHref: {
            VEHtmlElementAHref *newElement = [[VEHtmlElementAHref alloc] init];
            newElement.title = [[[hppleElement firstChild] content] stringByTrimmingCharactersInSet:
                                [NSCharacterSet whitespaceCharacterSet]];
            
            newElement.url = [hppleElement objectForKey:@"href"];
            
            return newElement;
        }
            
        case HtmlElementTypeImgSrc: {
            VEHtmlElementImgSrc *newElement = [[VEHtmlElementImgSrc alloc] init];
            newElement.title = [hppleElement objectForKey:@"title"];
            
            newElement.src = [hppleElement objectForKey:@"src"];
            
            return newElement;
        }
    }
}

- (VEHtmlElementListBaseDelegate *)delegate
{
    switch (self.htmlElementType) {
        case HtmlElementTypeAHref:
            return [[VEHtmlElementAListDelegate alloc] initWithViewModel:self];
            
        case HtmlElementTypeImgSrc:
            return [[VEHtmlElementImgListDelegate alloc] initWithViewModel:self];
    }
}

- (VEHtmlElementListBaseDataSource *)dataSource
{
    switch (self.htmlElementType) {
        case HtmlElementTypeAHref:
            return [[VEHtmlElementAListDataSource alloc] initWithViewModel:self];
            
        case HtmlElementTypeImgSrc:
            return [[VEHtmlElementImgListDataSource alloc] initWithViewModel:self];
    }
}

@end
