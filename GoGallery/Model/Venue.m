//
//  Venue.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "Venue.h"
#import "Common.h"

@implementation Venue

- (instancetype) initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.ID = data[@"_id"];
        self.name = data[@"name"];
        self.about = data[@"galleryDescription"];
        self.email = data[@"email"];
        self.facebook = data[@"facebook"];
        self.city = data[@"city"];
        self.email = data[@"email"];
        
        self.schedule = [[NSArray alloc] initWithArray:data[@"schedule"]];
        
        self.address = data[@"address"];
        
        if ([Common isValidStringForURL:data[@"galleryLogo"]]) {
            self.logo = [Common makeFileURLWithString: data[@"galleryLogo"]];
        }
        if ([Common isValidStringForURL:data[@"link"]]) {
            self.link = [Common makeURLWithString:data[@"link"]];
        }
        self.phone = data[@"phone"];
        self.location = [[CLLocation alloc] initWithLatitude:[data[@"latitude"] floatValue] longitude:[data[@"longitude"] floatValue]];
    }
    return self;
}

@end

