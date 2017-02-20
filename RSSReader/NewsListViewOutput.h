//
//  NewsListViewOutput.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsListViewOutput <NSObject>

/**
 Метод использующийся для настройки View
 в соответствии с наличием интернет соединения 
 и передачей управления интерактору в случае успешной проверки
 */
- (void)setupViewAndStartGettingData;

@end
