//
//  ScreenManager.m
//  RSSReader
//
//  Created by Katrin on 19.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "ScreenManager.h"

@interface ScreenManager()

@property (nonatomic, weak) MBProgressHUD *hud;

@end

@implementation ScreenManager

+ (instancetype)sharedManager {
    static dispatch_once_t once;
    static ScreenManager *sharedManager = nil;
    dispatch_once(&once, ^ {
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (MBProgressHUD *)showHUDAddedToView:(UIView *)view {
    if (!view) {
        view = [[UIApplication sharedApplication].delegate window].rootViewController.view;
    }
    if (self.hud) {
        return self.hud;
    }
    if (view) {
        self.hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    return self.hud;
}
- (void)hideHUD {
    if (self.hud) {
        [self.hud hideAnimated:YES];
    }
    self.hud = nil;
}
@end
