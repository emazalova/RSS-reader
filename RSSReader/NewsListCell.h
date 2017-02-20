//
//  NewsListCell.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListConfigurableCell.h"

/**
 Ячейка, используемая для краткого отображения новости в списке
 */
@interface NewsListCell : UITableViewCell <NewsListConfigurableCell>
@property (weak,nonatomic) IBOutlet UIImageView *imageNews;
@property (weak,nonatomic) IBOutlet UILabel *titleLabel;
@property (weak,nonatomic) IBOutlet UILabel *dateOfPublicationLabel;
@property (weak,nonatomic) IBOutlet UILabel *linkSourceLabel;
@end
