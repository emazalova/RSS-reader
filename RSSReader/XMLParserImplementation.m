//
//  XMLParserImplementation.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "XMLParserImplementation.h"
#import "NewsTableViewCellObject.h"


@interface XMLParserImplementation() <NSXMLParserDelegate> {
    BOOL isItem;
}

@property (strong,nonatomic) NSMutableDictionary *favouritesData;
@property (strong,nonatomic) NSString *keyElement;
@property (strong,nonatomic) NSString *foundCharacters;
@property (strong,nonatomic) NSMutableArray *parsedDataList;

@end

@implementation XMLParserImplementation

/**
 Методы инициализации
 */

- (instancetype)init {
    
    isItem = NO;
    self.favouritesData = [NSMutableDictionary dictionary];
    self.parsedDataList = [NSMutableArray array];
    
    return self;
}

/**
 Сортировка моделей NewsList по дате публикации
 */
- (NSArray *)sortArrayByPublicationDate:(NSMutableArray *)newsList {
    NSArray *sortedArray = [newsList sortedArrayUsingComparator:^NSComparisonResult(id firstElement, id nextElement) {
        NSDate *firstDate = [(NewsTableViewCellObject*)firstElement dateOfPublication];
        NSDate *secondDate = [(NewsTableViewCellObject*)nextElement dateOfPublication];
        return [secondDate compare:firstDate];
    }];
    return sortedArray;
}

/**
 Метод, преобразующий промежуточные данные в модели NewsList
 */
- (NSArray *)treatedDataListFrom:(NSArray *)parsedDataList {
    
    if (!parsedDataList.count) {
        return parsedDataList;
    }
    NSMutableArray *treatedDataList = [NSMutableArray array];
    for (int i = 0; i<parsedDataList.count; i++) {
        
        NewsTableViewCellObject *news = [[NewsTableViewCellObject alloc] init];
        NSDictionary *favouritesData = [parsedDataList objectAtIndex:i];
        
        news.titleNews = [favouritesData objectForKey:@"title"];
        news.imageUrl = [NSURL URLWithString:[favouritesData objectForKey:@"enclosure"]];
        news.linkSource = [favouritesData objectForKey:@"link"];
        id objectPubDate = [favouritesData objectForKey:@"pubDate"];
        if ([objectPubDate isKindOfClass:[NSString class]]) {
            news.dateOfPublication = [objectPubDate dateFormatRepresentation];
        }
        [treatedDataList addObject:news];
    }
    return [self sortArrayByPublicationDate:treatedDataList];
}

#pragma mark - XMLParser

- (void)createAndstartParsingWithContentsOfURL:(NSURL *)rssUrl {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:rssUrl];
    parser.delegate = self;
    [parser parse];
}


- (NSArray *)getParsedDataList {
    return [self treatedDataListFrom:self.parsedDataList];
}

#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
                                        namespaceURI:(NSString *)namespaceURI
                                        qualifiedName:(NSString *)qName
                                        attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    if ([elementName isEqualToString:@"item"]) {
        isItem = YES;
    }
    if (!isItem) {
        return;
    }
   
    if ([elementName isEqualToString:@"enclosure"]) {
        self.foundCharacters = [attributeDict objectForKey:@"url"];
    }
    if (([elementName isEqualToString:@"title"])||([elementName isEqualToString:@"link"])||([elementName isEqualToString:@"pubDate"])||[elementName isEqualToString:@"enclosure"]) {
        self.keyElement = elementName;
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
                                    namespaceURI:(NSString *)namespaceURI
                                    qualifiedName:(NSString *)qName {
    if ((!self.keyElement)||(!self.foundCharacters)) {
        return;
    }
    
    [self.favouritesData setObject:self.foundCharacters forKey:self.keyElement];
    self.foundCharacters = nil;
    if ([self.keyElement isEqualToString:@"enclosure"]) {
        NSDictionary *tempData = [self.favouritesData copy];
        [self.parsedDataList addObject:tempData];
        [self.favouritesData removeAllObjects];
    }
    self.keyElement = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (([self.keyElement isEqualToString:@"title"])||([self.keyElement isEqualToString:@"link"])||([self.keyElement isEqualToString:@"pubDate"])) {
        self.foundCharacters = string;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.delegate parsingWasObtainFinished];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"ERROR is %@",parseError.description);
    [self.delegate parsingWasObtainWithError:parseError];
}

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    NSLog(@"ERROR is %@",validationError.description);
    [self.delegate parsingWasObtainWithError:validationError];
}

@end
