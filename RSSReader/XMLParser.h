//
//  XMLParser.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorHandler.h"


@protocol XMLParserDelegate

- (void)parsingWasObtainFinished;
- (void)parsingWasObtainWithError:(NSError *)error;

@end

/**
 Протокол, описывающий методы для начала обработки данных 
 и получению обработанных данных в ввиде спика моделей NewsList
 */
@protocol XMLParser <NSObject>

/**
 Метод для получения моделей списка новостей
 @return массив моделей NewsList
 */
- (NSArray *)getParsedDataList;

/**
 Метод для создания объекта NSXMLParser 
 и старта парсинга данных по адресу
 */
- (void)createAndstartParsingWithContentsOfURL:(NSURL *)rssUrl;

@end
