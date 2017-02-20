//
//  ErrorHandler.m
//  RSSReader
//
//  Created by Katrin on 19.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "ErrorHandler.h"
#import "AlertHelper.h"


@implementation ErrorHandler

+ (void)handleError:(NSError *)error {
    switch (error.code) {
        case NSURLErrorNotConnectedToInternet:
            [AlertHelper showAlertWithTitle:@"" andMessage:@"alertInternetNotAvaible".localized];
            break;
        default:
            [AlertHelper showAlertWithTitle:@"alertWarning".localized andMessage:error.description];
            break;
    }
}

@end
