//
//  NewsListConfigurableCell.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CellObject;

@protocol NewsListConfigurableCell <NSObject>
- (void)configureWithObject:(id<CellObject>)object;
@end
