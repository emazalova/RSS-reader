//
//  XMLParser.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XMLParserDelegate

- (void)parsingWasFinished;
- (void)parsingWasObtainWithSuccess;
- (void)parsingWasObtainWithFailureMessage:(NSString *)message;

@end

@protocol XMLParser <NSObject>

- (NSArray *)getParsedDataList;
- (void)startParsingWithContentsOfURL:(NSURL *)rssUrl;

@end
