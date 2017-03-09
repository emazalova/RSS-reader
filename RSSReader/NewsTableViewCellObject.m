//
//  NewsTableViewCellObject.m
//  RSSReader
//
//  Created by Katrin on 18.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsTableViewCellObject.h"
#import "NewsListTableViewCell.h"

@implementation NewsTableViewCellObject

- (Class)cellClass {
    return [NewsListTableViewCell class];
}
@end
