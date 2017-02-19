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
@implementation NewsListPresenter

#pragma mark - NewsListViewOutput

- (void)updateView {
    
   // NetworkStatus remoteHostStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    
    BOOL isReachable = [Reachability reachabilityForInternetConnection].isReachable;
    if (!isReachable) {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorNotConnectedToInternet userInfo:nil];
        [ErrorHandler handleError:error];
        return;
    }else {
        [self.view showHUD];
        [self.interactor startObtainData];
    }
    /*
    if (remoteHostStatus == NotReachable) {
        NSError *error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorNotConnectedToInternet userInfo:nil];
        [ErrorHandler handleError:error];
        return;
    }
    */
    
}

#pragma mark - NewsListInteractorOutput

- (void)didObtainData:(NSArray *)dataList {
    [self.view hideHUD];
       if (dataList.count > 0) {
        [self.view showNewsData:dataList];
    }else {
        [self.view showNoContentScreen];
    }
}

- (void)didObtainWithError:(NSError *)error {
    [ErrorHandler handleError:error];
}


@end
