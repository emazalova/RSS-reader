//
//  NSString+Extension.m
//  RSSReader
//
//  Created by Katrin on 18.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)dateFormatRepresentation {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZZ"];
    NSDate *date = [dateFormatter dateFromString:self];
    /*
     if the format has been changed return self
     */
    if (!date) {
        return self;
    }
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)localized {
    return NSLocalizedString(self, comment: self);
}
@end
