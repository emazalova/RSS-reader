//
//  NSDate+Extension.m
//  RSSReader
//
//  Created by Katrin on 19.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSString *)stringRepresentation {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss"];
    return [dateFormatter stringFromDate:self];
}
@end
