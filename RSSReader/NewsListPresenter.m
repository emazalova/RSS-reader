//
//  NewsListPresenter.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListPresenter.h"

@implementation NewsListPresenter

#pragma mark - NewsListViewOutput

- (void)updateView {
    [self.interactor startObtainData];
}

#pragma mark - NewsListInteractorOutput

- (void)didObtainData:(NSArray *)dataList {
    
    if (dataList.count > 0) {
        [self.view showNewsData:dataList];
    }else {
        [self.view showNoContentScreen];
    }
}
- (void)didObtainWithSuccess {
    //успех
}
- (void)didObtainWithFailureMessage:(NSString *)message {
    //ошибка, надо ее вывести
    //как вариант передать во вьюху сообщение
}


@end
