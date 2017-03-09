//
//  NewsListDataDisplayManager.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListDataDisplayManager.h"
#import "CellObject.h"
#import "NewsListConfigurableCell.h"

@protocol CellObject;

@interface NewsListDataDisplayManager() <UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) NSArray *news;

@end

@implementation NewsListDataDisplayManager 

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView {
    return self;
}

- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView {
    return self;
}

- (void)handleNewsData:(NSArray *)news {
    self.news = news;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<CellObject> model = [self.news objectAtIndex:indexPath.row];
    NSString *ident = NSStringFromClass([model cellClass]);
    
    UITableViewCell<NewsListConfigurableCell> *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        cell = [[UITableViewCell<NewsListConfigurableCell> alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    [cell configureWithObject:model];
    return cell;
    
}

@end
