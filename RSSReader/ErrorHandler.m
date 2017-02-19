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
    [AlertHelper showAlertWithTitle:@"alertWarning" andMessage:[error localizedDescription]];
}

+ (void)handleErrorWithType:(ErrorType)errorType {
    switch (errorType) {
        case InternetNotReachableErrorType:
            [AlertHelper showAlertWithTitle:@"" andMessage:@"alertInternetNotAvaible".localized];
            break;
            
        case TimeoutErrorType:
            [AlertHelper showAlertWithTitle:@"" andMessage:@"alertInternetNotAvaible".localized];
            break;
        
        default:
            break;
    }
}

@end
