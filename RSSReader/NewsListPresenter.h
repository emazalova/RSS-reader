//
//  NewsListPresenter.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NewsListViewOutput.h"
#import "NewsListInteractorOutput.h"
#import "NewsListViewInput.h"
#import "NewsListInteractorInput.h"

@interface NewsListPresenter : NSObject <NewsListViewOutput, NewsListInteractorOutput>

@property (nonatomic, weak) id<NewsListViewInput> view;
@property (nonatomic, strong) id<NewsListInteractorInput> interactor;

@end
