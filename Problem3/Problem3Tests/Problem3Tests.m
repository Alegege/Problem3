//
//  Problem3Tests.m
//  Problem3Tests
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "VEHtmlElementViewModel.h"

SPEC_BEGIN(Problem3Tests)

describe(@"VEHtmlElementViewModel", ^{
    
    context(@"parsing html elements", ^{
        
        NSURL *htmlUrl = [[NSBundle bundleForClass:self.class] URLForResource:@"visual-engine" withExtension:@"html"];
        
        it(@"parses 36 a[href] elements", ^{
            VEHtmlElementViewModel *viewModel = [[VEHtmlElementViewModel alloc] initWithUrl:htmlUrl
                                                                            htmlElementType:HtmlElementTypeAHref];
            [viewModel loadWebsite];
            
            [[expectFutureValue(viewModel.elements) shouldEventually] haveCountOf:36];
        });
        
        it(@"parses 17 img elements", ^{
            VEHtmlElementViewModel *viewModel = [[VEHtmlElementViewModel alloc] initWithUrl:htmlUrl
                                                                            htmlElementType:HtmlElementTypeImgSrc];
            
            [viewModel loadWebsite];
            
            [[expectFutureValue(viewModel.elements) shouldEventually] haveCountOf:17];
        });
    });
});

SPEC_END
