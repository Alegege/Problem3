//
//  AppDelegate.m
//  Problem3
//
//  Created by Alejandro Garcia on 1/10/15.
//  Copyright © 2015 Alejandro Garcia. All rights reserved.
//

#import "AppDelegate.h"
#import "VEWebsiteSelectorViewController.h"
#import "UIColor+VEColor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[VEWebsiteSelectorViewController new]];
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    navigationController.navigationBar.barTintColor = [UIColor ve_brandColor];
    navigationController.navigationBar.translucent = NO;
    navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
