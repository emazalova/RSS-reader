//
//  NewsListViewInput.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol NewsListViewInput <RamblerViperModuleInput>

- (void)showNoContentScreen;
- (void)showNewsData:(NSArray *)news;
- (void)showHUD;
- (void)hideHUD;

@end
