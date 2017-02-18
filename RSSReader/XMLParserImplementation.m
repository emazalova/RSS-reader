//
//  XMLParserImplementation.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "XMLParserImplementation.h"
#import "NewsList.h"
#import "NSString+DateFormat.h"

@interface XMLParserImplementation() <NSXMLParserDelegate> {
    BOOL isItem;
}

@property (strong,nonatomic) NSMutableDictionary *favouritesData;
@property (strong,nonatomic) NSString *keyElement;
@property (strong,nonatomic) NSString *foundCharacters;
@property (strong,nonatomic) NSMutableArray *parsedDataList;

@end

@implementation XMLParserImplementation

#pragma mark - Init

+ (XMLParserImplementation*)shared {
    
    static XMLParserImplementation *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[XMLParserImplementation alloc] init];
    });
    
    return manager;
}
- (instancetype)init {
    
    isItem = NO;
    self.favouritesData = [NSMutableDictionary dictionary];
    self.parsedDataList = [NSMutableArray array];
    
    return self;
}
#pragma mark - handle data to model NewsList

/*
 convert the intermediate data in NewsList model
 */
- (NSArray *)treatedDataListFrom:(NSArray *)parsedDataList {
    
    if (!parsedDataList.count) {
        return parsedDataList;
    }
    NSMutableArray *treatedDataList = [NSMutableArray array];
    for (int i = 0; i<parsedDataList.count; i++) {
        
        NewsList *news = [[NewsList alloc] init];
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
    return treatedDataList;
}

#pragma mark - XMLParser

- (void)startParsingWithContentsOfURL:(NSURL *)rssUrl {
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:rssUrl];
    parser.delegate = self;
    [parser parse];
}
/*
 get array with NewsList models
 */
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
    [self.delegate parsingWasFinished];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    #warning TODO: error handler
    NSLog(@"ERROR is %@",parseError.description);
}

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    #warning TODO: error handler
    NSLog(@"ERROR is %@",validationError.description);
}

@end
