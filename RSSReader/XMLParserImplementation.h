//
//  XMLParserImplementation.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"

@interface XMLParserImplementation : NSObject <XMLParser>

@property (weak,nonatomic) id <XMLParserDelegate> delegate;

@end
