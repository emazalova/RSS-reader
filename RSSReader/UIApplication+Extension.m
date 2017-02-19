//
//  UIApplication+Extension.m
//  RSSReader
//
//  Created by Katrin on 19.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "UIApplication+Extension.h"
#import "UIViewController+Extension.h"

@implementation UIApplication (Extension)

+ (UIViewController *)getTopMostViewController {
    return [[self sharedApplication].keyWindow.rootViewController findTopMostViewControllerOrSelf];
}
@end
