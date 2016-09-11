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
            if (data == nil) {
                NSString *a;
            };
            return YES;
        }
    };
    return FALSE;
}

+ (nullable NSURL *) makeURLWithString: (NSString *) imgName {
    
    NSLog(imgName);
    
   NSString *ne = [[NSBundle mainBundle] pathForResource:imgName ofType: nil];
    NSLog(ne);
    
    if (ne==nil) {
        return nil;
    } else {
   return [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource :imgName ofType: nil]];
    }
}

@end
