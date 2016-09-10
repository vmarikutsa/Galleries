//
//  Common.h
//  GoGallery
//
//  Created by Ivan on 9/4/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject
+ (BOOL) isValidStringForURL: (NSObject *)data;
+ (nullable NSURL *) makeURLWithString: (NSString *) imgName;
@end
