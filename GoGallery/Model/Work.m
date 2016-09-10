//
//  Work.m
//  GoGallery
//
//  Created by Ivan on 9/4/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Work.h"
#import "Common.h"

@implementation Work

-(instancetype) initWithDictionary:(NSDictionary *)data{
    self = [super init];
    
    if (self) {
        self.ID = data[@"_id"];
        self.author = data[@"author"];
        if ([Common isValidStringForURL: data[@"imgPicture"]]) {
            //self.imgURL = [[NSURL alloc] initWithString:data[@"imgPicture"]];
            //self.imgURL = [[NSURL alloc] initWithString: [[NSBundle mainBundle] pathForResource:data[@"imgPicture"] ofType: nil]];
            self.imgURL = [Common makeURLWithString:data[@"imgPicture"]];
        }
    }
    
    return self;
};
@end
