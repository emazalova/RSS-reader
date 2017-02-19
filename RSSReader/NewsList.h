//
//  NewsList.h
//  RSSReader
//
//  Created by Katrin on 18.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellObject.h"
@interface NewsList : NSObject <CellObject>

@property (strong,nonatomic) NSString *titleNews;
@property (strong,nonatomic) NSString *linkSource;
@property (strong,nonatomic) NSURL *imageUrl;
@property (strong,nonatomic) NSDate *dateOfPublication;

@end
