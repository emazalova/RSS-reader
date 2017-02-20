//
//  NewsListInteractorOutput.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorHandler.h"
@protocol NewsListInteractorOutput <NSObject>

/**
 Метод для дальнейшей передачи списка новостей 
 при завершении парсинга данных по запросу
 */
- (void)didObtainData:(NSArray *)dataList;

/**
 Метод для обработки ошибок по окончанию выполнения запроса
 */
- (void)didObtainWithError:(NSError *)error;

@end
