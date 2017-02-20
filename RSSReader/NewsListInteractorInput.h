//
//  NewsListInteractorInput.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsListInteractorInput <NSObject>

/**
 Метод создает парсер и стартует процесс для получения данных
 для списка новостей 
 */
- (void)createParserAndStartObtainDataWithURL:(NSURL *)url;

@end
