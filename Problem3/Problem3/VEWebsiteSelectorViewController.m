//
//  VEWebsiteSelectorViewController.m
//  Problem3
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEWebsiteSelectorViewController.h"
#import "VEHtmlElementListViewController.h"
#import "VEHtmlElement.h"
#import "UIColor+VEColor.h"

@interface VEWebsiteSelectorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *url;

@property (weak, nonatomic) IBOutlet UISegmentedControl *htmlElement;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@property (nonatomic, assign) BOOL elementListVisible;

@end

@implementation VEWebsiteSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Enter URL", nil);
    
    [self setupUIElements];
}

- (void)setupUIElements {
    
    /** Title label setup */
    self.htmlElement.tintColor = [UIColor ve_brandColor];
    
    /** Next button setup */
    self.nextButton.tintColor = [UIColor ve_brandColor];
}

- (IBAction)validateURL:(id)sender {
    NSURL *myURL = [NSURL URLWithString:self.url.text];
    
    if (myURL && myURL.scheme && myURL.host) {        
        self.elementListVisible = !self.elementListVisible;
        
        VEHtmlElementListViewController *htmlElementList = [[VEHtmlElementListViewController alloc] initWithURL:myURL htmlElementType:self.htmlElement.selectedSegmentIndex];
        [self.navigationController pushViewController:htmlElementList animated:YES];
    }
}

@end
