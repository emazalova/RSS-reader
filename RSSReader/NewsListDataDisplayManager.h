//
//  NewsListDataDisplayManager.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
Объект, закрывающий логику реализации `UITableViewDataSource` и `UITableViewDelegate`
 */
@interface NewsListDataDisplayManager : NSObject 

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView;
- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView;

- (void)handleNewsData:(NSArray *)news;

@end
