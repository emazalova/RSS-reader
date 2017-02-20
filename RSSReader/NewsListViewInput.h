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

/**
 Метод для отображения списка новостей
 */
- (void)showNewsData:(NSArray *)news;

/**
 Метод для отображения активити индикатора
 */
- (void)showHUD;

/**
 Метод для скрытия активити индикатора
 */
- (void)hideHUD;


@end
