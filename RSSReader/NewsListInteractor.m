//
//  NewsListInteractor.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListInteractor.h"
#import "XMLParserImplementation.h"
#define baseURL @"https://lenta.ru/rss"

@interface NewsListInteractor() <XMLParserDelegate>

//@property (strong,nonatomic) NSURL *baseURL;

@end
@implementation NewsListInteractor
/*
+ (NewsListInteractor*)shared {
    
    static NewsListInteractor *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NewsListInteractor alloc] init];
    });
    
    return manager;
}
- (instancetype)init {
    
   // self.baseURL = [NSURL URLWithString:@""];
    return self;
}
*/
#pragma mark - XMLParserDelegate

- (void)parsingWasObtainWithError:(NSError *)error {
    [self.output didObtainWithError:error];
}

- (void)parsingWasObtainFinished {
    [self.output didObtainData:[self.parser getParsedDataList]];
}
#pragma mark - NewsListInteractorInput

- (void)startObtainData {
    
    self.parser = [[XMLParserImplementation alloc] init];
    self.parser.delegate = self;

    [self.parser startParsingWithContentsOfURL:[NSURL URLWithString:baseURL]];
}

@end
