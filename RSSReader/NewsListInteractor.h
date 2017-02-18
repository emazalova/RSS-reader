//
//  NewsListInteractor.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsListInteractorInput.h"
#import "NewsListInteractorOutput.h"
#import "XMLParserImplementation.h"
@interface NewsListInteractor : NSObject <NewsListInteractorInput>

@property (nonatomic, weak) id <NewsListInteractorOutput> output;
//@property (nonatomic, strong) id <XMLParser> parser;
@property (nonatomic, strong) XMLParserImplementation* parser;

@end
