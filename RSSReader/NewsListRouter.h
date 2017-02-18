//
//  NewsListRouter.h
//  RSSReader
//
//  Created by Katrin on 18.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListRouterInput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>
#import <Foundation/Foundation.h>

@interface NewsListRouter : NSObject <NewsListRouterInput>
@property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;
@end
