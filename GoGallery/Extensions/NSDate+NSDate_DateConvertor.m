//
//  NSDate+NSDate_DateConvertor.m
//  GoGallery
//
//  Created by Наталья on 16.09.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "NSDate+NSDate_DateConvertor.h"

@implementation NSDate (NSDate_DateConvertor)
- (NSString *) strDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [formatter setDateFormat:@"dd.MM.yy"];
    return [formatter stringFromDate:self];
}
@end
