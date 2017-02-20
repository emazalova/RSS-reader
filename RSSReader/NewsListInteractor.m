//
//  NewsListInteractor.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListInteractor.h"
#import "XMLParserImplementation.h"


@interface NewsListInteractor() <XMLParserDelegate>

@end
@implementation NewsListInteractor

#pragma mark - XMLParserDelegate

- (void)parsingWasObtainWithError:(NSError *)error {
    [self.output didObtainWithError:error];
}

- (void)parsingWasObtainFinished {
    [self.output didObtainData:[self.parser getParsedDataList]];
}
#pragma mark - NewsListInteractorInput

- (void)createParserAndStartObtainDataWithURL:(NSURL *)url {
    
    self.parser = [[XMLParserImplementation alloc] init];
    self.parser.delegate = self;

    [self.parser createAndstartParsingWithContentsOfURL:url];
}

@end
