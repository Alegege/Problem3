//
//  VEViewController.h
//  Problem3
//
//  Created by Alejandro Garcia on 3/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VEViewController : UIViewController

/**
 * Show a loading HUD and dimm our view.
 */
- (void)showLoadingHUD;

/**
 * Same as `showLoadingHUD` but with a custom message
 * @param title The text to be displayed inside the loading HUD
 */
- (void)showLoadingHUDWithTitle:(NSString *)title;

/**
 * Hide the loading HUD, if present.
 */
- (void)hideLoadingHUD;

@end
