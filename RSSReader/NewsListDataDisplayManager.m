//
//  NewsListDataDisplayManager.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListDataDisplayManager.h"
#import "NewsListCell.h"
#import "CellObject.h"

@protocol NewsListConfigurableCell;
@protocol CellObject;

@interface NewsListDataDisplayManager()

@property (strong,nonatomic) NSArray *news;
@end
@implementation NewsListDataDisplayManager 

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView {
    return tableView.dataSource;
}
- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView
                               withBaseDelegate:(id <UITableViewDelegate>)baseTableViewDelegate {
    return tableView.delegate;
    
}

- (void)handleNewsData:(NSArray *)news {
    self.news = news;
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //static NSString *identifier = newsListCellIdentifier;
    
    id<CellObject> model = [self.news objectAtIndex:indexPath.row];
    NSString *ident = [model cellIdentifier];
    
    UITableViewCell<NewsListConfigurableCell> *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    //[tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell<NewsListConfigurableCell> alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    [cell configureWithObject:model];
    return cell;
    /*
    let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.hotelCellIdentifier, for: indexPath)
    
    if let hotel = model.hotels?[indexPath.row], let cell = cell as? HotelCell  {
        cell.hotel = hotel
    }
    return cell
    */
}

@end
