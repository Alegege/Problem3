//
//  VEViewController.m
//  Problem3
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "VEViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface VEViewController () <MBProgressHUDDelegate>

@end

@implementation VEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addDismissKeyboardGesture];
}

#pragma mark - Loading HUD

- (void)showLoadingHUD
{
    [self showLoadingHUDWithTitle:@"Loading HTML elements"];
}

- (void)showLoadingHUDWithTitle:(NSString *)title
{
    MBProgressHUD *hud;
    
    hud = [[MBProgressHUD alloc] initWithView:[self viewForAttachingLoadingHUD]];
    hud.dimBackground = YES;
    hud.labelText = title;
    
    if (![self existingProgressHudInView:[self viewForAttachingLoadingHUD]]) {
        [[self viewForAttachingLoadingHUD] addSubview:hud];
        [hud show:YES];
    }
}

- (BOOL)existingProgressHudInView:(UIView *)view
{
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[MBProgressHUD class]]) return YES;
    }
    return NO;
}

- (void)hideLoadingHUD
{
    [MBProgressHUD hideHUDForView:[self viewForAttachingLoadingHUD] animated:YES];
}

- (UIView *)viewForAttachingLoadingHUD
{
    return self.view;
}

- (void)addDismissKeyboardGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(endEditing)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

- (void)endEditing
{
    [self.view endEditing:YES];
}

@end
