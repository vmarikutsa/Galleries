//
//  Common.m
//  GoGallery
//
//  Created by Ivan on 9/4/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (BOOL) isValidStringForURL:(NSObject*)data {
    if ([data isKindOfClass:[NSString class]]) {
        if (![data  isEqual: @""]){
            return YES;
        }
    };
    return FALSE;
}

+ (nullable NSURL *) makeFileURLWithString: (NSString *) imgName {

   NSString *ne = [[NSBundle mainBundle] pathForResource:imgName ofType: nil];
    
    if (ne==nil) {
        return nil;
    } else {
   return [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource :imgName ofType: nil]];
    }
}

+ (nullable NSURL *) makeURLWithString: (NSString *) strURL {
    NSURL *newURL = [[NSURL alloc] initWithString:strURL];
    return newURL;
}

@end
