//
//  AlertHelper.m
//  RSSReader
//
//  Created by Katrin on 19.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "AlertHelper.h"
#import <UIKit/UIKit.h>
#import "UIApplication+Extension.h"
@implementation AlertHelper

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"okButtonTitle".localized
                                                          style:UIAlertActionStyleDefault
                                                        handler:nil];
    [alertController addAction:alertAction];
    
    [[UIApplication getTopMostViewController] presentViewController:alertController animated:YES completion:nil];
}
@end
