//
//  ScreenManager.h
//  RSSReader
//
//  Created by Katrin on 19.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface ScreenManager : NSObject
+ (instancetype)sharedManager;
- (MBProgressHUD *)showHUDAddedToView:(UIView *)view;
- (void)hideHUD;
@end
