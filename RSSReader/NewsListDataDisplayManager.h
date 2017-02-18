//
//  NewsListDataDisplayManager.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NewsListDataDisplayManager : NSObject <UITableViewDataSource, UITableViewDelegate>

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView;
- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView
                               withBaseDelegate:(id <UITableViewDelegate>)baseTableViewDelegate;

- (void)handleNewsData:(NSArray *)news;

@end
