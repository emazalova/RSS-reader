//
//  XMLParser.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorHandler.h"
@protocol XMLParserDelegate

- (void)parsingWasObtainFinished;
- (void)parsingWasObtainWithError:(NSError *)error;

@end

@protocol XMLParser <NSObject>

- (NSArray *)getParsedDataList;
- (void)startParsingWithContentsOfURL:(NSURL *)rssUrl;

@end
