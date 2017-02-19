//
//  UIViewController+Extension.m
//  RSSReader
//
//  Created by Katrin on 19.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (UIViewController *)findTopMostViewControllerOrSelf {
    if (self.presentedViewController) {
        return [self.presentedViewController findTopMostViewControllerOrSelf];
    }
    if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navVC = (UINavigationController *)self;
        if (navVC.visibleViewController) {
            return [navVC.visibleViewController findTopMostViewControllerOrSelf];
        }
    }
    if ([self isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarVC = (UITabBarController *)self;
        if (tabBarVC.selectedViewController) {
            return [tabBarVC.selectedViewController findTopMostViewControllerOrSelf];
        }
    }
    return self;
}
@end
