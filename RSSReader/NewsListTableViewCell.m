//
//  NewsListTableViewCell.m
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NewsListTableViewCell.h"
#import "NewsTableViewCellObject.h"
#import "UIImageView+WebCache.h"
#import "NSDate+Extension.h"
@implementation NewsListTableViewCell

#pragma mark - NewsListConfigurableCell

- (void)configureWithObject:(id<CellObject>)object {
    if (![object isKindOfClass:[NewsTableViewCellObject class]]) {
        return;
    }
    NewsTableViewCellObject *model = (NewsTableViewCellObject *)object;
    [self.titleLabel setText:[NSString stringWithFormat:@"%@",model.titleNews]];
    [self.dateOfPublicationLabel setText:[NSString stringWithFormat:@"%@",model.dateOfPublication.stringRepresentation]];
    [self.linkSourceLabel setText:[NSString stringWithFormat:@"%@",model.linkSource]];
    [self.imageNews  sd_setImageWithURL:model.imageUrl];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
