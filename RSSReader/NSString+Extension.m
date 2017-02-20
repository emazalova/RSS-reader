//
//  NSString+Extension.m
//  RSSReader
//
//  Created by Katrin on 18.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSDate *)dateFormatRepresentation {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss ZZZ"];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

- (NSString *)localized {
    return NSLocalizedString(self, comment: self);
}
@end
