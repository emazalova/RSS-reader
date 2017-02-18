//
//  NewsListInteractorOutput.h
//  RSSReader
//
//  Created by Katrin on 17.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewsListInteractorOutput <NSObject>

- (void)didObtainData:(NSArray *)dataList;
- (void)didObtainWithSuccess;
- (void)didObtainWithFailureMessage:(NSString *)message;

@end
