//
//  NSString+DateFormat.m
//  RSSReader
//
//  Created by Katrin on 18.02.17.
//  Copyright © 2017 Katrin Mazalova. All rights reserved.
//

#import "NSString+DateFormat.h"

@implementation NSString (DateFormat)

- (NSString *)dateFormatRepresentation {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd MMM yyyy. hh:mm a"];
    NSDate *now = [NSDate date];
    NSString *theDate = [dateFormat stringFromDate:now];
    return theDate;
}

@end
