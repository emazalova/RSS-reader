//
//  NewsListViewController.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListViewController.h"
#import "TopMostHUDManager.h"

@interface NewsListViewController ()

@property (strong,nonatomic) NSArray *newsList;
@property (nonatomic, strong) NewsListDataDisplayManager *dataDisplayManager;
@end

@implementation NewsListViewController

#pragma mark - NewsListViewInput

- (void)showNewsData:(NSArray *)news {
    
    [self.dataDisplayManager handleNewsData:news];
    [self.tableView reloadData];
}

- (void)showHUD {
    [[TopMostHUDManager sharedManager] showHUDAddedToView:self.view];
}

- (void)hideHUD {
    [[TopMostHUDManager sharedManager] hideHUD];
}

#pragma mark - Life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    
    self.dataDisplayManager = [[NewsListDataDisplayManager alloc] init];
    
    self.tableView.estimatedRowHeight = self.tableView.rowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView];
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
    
    [self.output setupViewAndStartGettingData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

@end
