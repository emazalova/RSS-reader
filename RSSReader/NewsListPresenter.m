//
//  NewsListPresenter.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListPresenter.h"
#import "ErrorHandler.h"
#import <Reachability/Reachability.h>
#import "Constant.h"

@implementation NewsListPresenter

#pragma mark - NewsListViewOutput

- (void)setupViewAndStartGettingData {
    
    BOOL isReachable = [Reachability reachabilityForInternetConnection].isReachable;
    if (!isReachable) {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorNotConnectedToInternet userInfo:nil];
        [ErrorHandler handleError:error];
        return;
    }else {
       
        [self.view showHUD];
        [self.interactor createParserAndStartObtainDataWithURL:[NSURL URLWithString:baseURL]];
    }
}


#pragma mark - NewsListInteractorOutput

- (void)didObtainData:(NSArray *)dataList {
    [self.view hideHUD];
       if (dataList.count > 0) {
        [self.view showNewsData:dataList];
    }
}

- (void)didObtainWithError:(NSError *)error {
    [ErrorHandler handleError:error];
}


@end
