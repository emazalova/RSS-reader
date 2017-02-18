//
//  NewsListAssembly.m
//  RSSReader
//
//  Created by Katrin on 18.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListAssembly.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

#import "NewsListViewController.h"
#import "NewsListInteractor.h"
#import "NewsListPresenter.h"
#import "NewsListRouter.h"

@interface NewsListAssembly()

@end

@implementation NewsListAssembly


- (NewsListViewController *)viewModuleNewsList {
    
    return [TyphoonDefinition withClass:[NewsListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterModuleNewsList]];
                          }];
}

- (NewsListInteractor *)interactorModuleNewsList {
    
    return [TyphoonDefinition withClass:[NewsListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterModuleNewsList]];
                          }];
}

- (NewsListPresenter *)presenterModuleNewsList {
    
    return [TyphoonDefinition withClass:[NewsListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewModuleNewsList]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorModuleNewsList]];
                              //[definition injectProperty:@selector(router)
                                                    //with:[self routerModuleNewsList]];
                          }];
}

- (NewsListRouter *)routerModuleNewsList {
    return [TyphoonDefinition withClass:[NewsListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewModuleNewsList]];
                          }];
}



@end
