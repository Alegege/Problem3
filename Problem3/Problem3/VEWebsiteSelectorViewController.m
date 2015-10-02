//
//  VEWebsiteSelectorViewController.m
//  Problem3
//
//  Created by Alejandro Garcia on 1/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEWebsiteSelectorViewController.h"
#import "VEHtmlElementListViewController.h"
#import "UIColor+VEColor.h"

@interface VEWebsiteSelectorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@property (nonatomic, assign) BOOL elementListVisible;

@end

@implementation VEWebsiteSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Enter URL";
    
    [self setupUIElements];
}

- (void)setupUIElements {
    
    /** Title label setup */
    self.stackView.center = self.view.center;
    self.stackView.backgroundColor = [UIColor redColor];
    
    /** Next button setup */
    self.nextButton.tintColor = [UIColor ve_brandColor];
}

- (IBAction)validateURL:(id)sender {
    NSURL *myURL = [NSURL URLWithString:self.urlTextField.text];
    
    if (myURL && myURL.scheme && myURL.host) {
        NSLog(@"URL is validated");
        
        if (!self.elementListVisible) {
            [UIView animateWithDuration:1.0
                                  delay:0.0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 CGRect frame = self.view.frame;
                                 frame.size.height = self.stackView.frame.size.height;
                                 
                                 self.view.frame = frame;
                                 self.stackView.spacing = 5.0;
                                 self.stackView.center = self.view.center;
                             }
                             completion:^(BOOL finished) {
                                 self.elementListVisible = !self.elementListVisible;
                                 
                                 VEHtmlElementListViewController *htmlElementList = [[VEHtmlElementListViewController alloc] initWithURL:myURL htmlElementType:HtmlElementTypeA];
                                 [self.navigationController pushViewController:htmlElementList animated:YES];
                             }
             ];
        }
        
    }
    
    
}

@end
