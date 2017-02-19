//
//  NewsListViewController.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListViewInput.h"
#import "NewsListViewOutput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "NewsListDataDisplayManager.h"

@protocol RamblerViperModuleConfiguratorProtocol;

@interface NewsListViewController : UIViewController <NewsListViewInput, RamblerViperModuleTransitionHandlerProtocol>

@property (nonatomic, strong) id <NewsListViewOutput> output;
@property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;
@property (nonatomic,strong) IBOutlet UITableView *tableView;

@end
