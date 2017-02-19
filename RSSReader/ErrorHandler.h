//
//  ErrorHandler.h
//  RSSReader
//
//  Created by Katrin on 19.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ErrorType) {
    InternetNotReachableErrorType,
    TimeoutErrorType
};
@interface ErrorHandler : NSObject

+ (void)handleError:(NSError *)error;
+ (void)handleErrorWithType:(ErrorType)errorType;

@end
