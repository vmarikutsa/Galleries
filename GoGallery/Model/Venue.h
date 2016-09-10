//
//  Venue.h
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Venue : NSObject

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *about;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *facebook;
@property (nonatomic,strong) NSArray <NSString*> *schedule;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSURL *logo;
@property (nonatomic, strong) NSURL *link;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic,strong) NSString *venueDescription;

- (instancetype) initWithDictionary:(NSDictionary *)data;

@end
