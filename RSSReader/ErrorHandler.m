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

/*
+ (void)handleErrorWithType:(ErrorType)errorType message:(NSString *)message{
    switch (errorType) {
        case InternetNotReachableErrorType:
            [AlertHelper showAlertWithTitle:@"" andMessage:@"alertInternetNotAvaible".localized];
            break;
            
        case TimeoutErrorType:
            [AlertHelper showAlertWithTitle:@"" andMessage:@"alertInternetNotAvaible".localized];
            break;
            
        case ValidationErrorType:
            [AlertHelper showAlertWithTitle:@"alertWarning".localized andMessage:message];
            break;
            
        case ParseErrorType:
            [AlertHelper showAlertWithTitle:@"alertWarning".localized andMessage:message];
            break;
            
        case OtherErrorType:
            [AlertHelper showAlertWithTitle:@"alertWarning".localized andMessage:message];
            break;
            
        default:
            break;
    }
}
*/
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
