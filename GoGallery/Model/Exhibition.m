//
//  Exhibition.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/22/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Exhibition.h"



@implementation Exhibition

- (instancetype) initWithDictionary:(NSDictionary *)data {
    self = [super initWithDictionary:data];
    if (self) {
        self.authorName = data[@"authorName"];
        self.authorDescription = data[@"authorDescription"];
        //self.works = [[NSSet alloc] init];
       /* for (NSString)*workID in data.works {
            
        };*/
    };
    return self;
}

- (NSURL *) imgURLForFirstWork {
    NSURL *firstURL = [[NSURL alloc] init];
    for (Work *w in self.works) {
        if (!(w.imgURL == nil)) {
            firstURL = w.imgURL;
        }
    }
    
    return firstURL;
}

@end
