//
//  VEHtmlElementImgCell.m
//  Problem3
//
//  Created by Alejandro Garcia on 4/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "UIImageView+AFNetworking.h"
#import "VEHtmlElementImgCell.h"

@interface VEHtmlElementImgCell ()

@property (weak, nonatomic) IBOutlet UIImageView *htmlImage;

@property (weak, nonatomic) IBOutlet UILabel *src;

@end

@implementation VEHtmlElementImgCell

- (void)setupCellWithHtmlElementImg:(VEHtmlElementImgSrc *)htmlElementImg
{
    NSURL *url = [NSURL URLWithString:htmlElementImg.src];
    [self.htmlImage setImageWithURL:url];
    
    self.src.text = htmlElementImg.src;
}

@end
