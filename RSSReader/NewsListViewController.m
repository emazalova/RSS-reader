//
//  NewsListViewController.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListViewController.h"
#import "ScreenManager.h"
@interface NewsListViewController ()

@property (strong,nonatomic) NSArray *newsList;
@property (nonatomic, strong) NewsListDataDisplayManager *dataDisplayManager;
@end

@implementation NewsListViewController

- (void)setup {
    self.dataDisplayManager = [[NewsListDataDisplayManager alloc] init];
    self.tableView.estimatedRowHeight = self.tableView.rowHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.delegate = self.dataDisplayManager;
    self.tableView.dataSource = self.dataDisplayManager;
    
    [self.output updateView];
}

#pragma mark - NewsListViewInput

- (void)showNoContentScreen {
    // Show custom empty screen.
}
- (void)showNewsData:(NSArray *)news {
    
    [self.dataDisplayManager handleNewsData:news];
    [self.tableView reloadData];
}

- (void)showHUD {
    [[ScreenManager sharedManager] showHUDAddedToView:self.view];
}

- (void)hideHUD {
    [[ScreenManager sharedManager] hideHUD];
}
#pragma mark - NewsListViewInput

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

@end
