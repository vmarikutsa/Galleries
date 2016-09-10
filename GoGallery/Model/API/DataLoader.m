//
//  DataLoader.m
//  GoGallery
//
//  Created by Kirill Kirikov on 8/19/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "DataLoader.h"
#import "Exhibition.h"
#import "Gallery.h"
#import "Work.h"

@implementation DataLoader

- (void) loadEventsWithCallback:(void (^)(NSArray <Event *> *, NSError *error))callback {
    
    NSError *error = nil;
    
    NSArray *rawWorks = [self loadJSON:@"works" withError:&error];
    NSArray *rawGalleries = [self loadJSON:@"galleries" withError:&error];
    NSArray *rawExhibitions = [self loadJSON:@"exhibitions" withError:&error];

    
    if (error) {
        return callback(nil, error);
    }
    
    NSMutableDictionary <NSString*, Work *> *works = [[NSMutableDictionary alloc] initWithCapacity:rawWorks.count];
    for (NSDictionary *dic in rawWorks) {
        Work *work = [[Work alloc] initWithDictionary:dic];
        [works setObject:work forKey: work.ID];
    }
    
    
    NSMutableDictionary <NSString *, Gallery *> *galleries = [[NSMutableDictionary alloc] initWithCapacity:[rawGalleries count]];
    
    for (NSDictionary *dic in rawGalleries) {
        Gallery *gal = [[Gallery alloc] initWithDictionary:dic];
        [galleries setObject:gal forKey:gal.ID];
    }
    
    
    NSMutableArray *exhibitions = [NSMutableArray arrayWithCapacity:[rawExhibitions count]];
    for (NSDictionary *dic in rawExhibitions) {
        Exhibition *ex = [[Exhibition alloc] initWithDictionary:dic];
        NSString *galleryId = [[dic[@"_p_gallery"] componentsSeparatedByString:@"$"] lastObject];
        ex.venue = galleries[galleryId];
        
        NSMutableSet *set = [[NSMutableSet alloc] init];
        for (NSDictionary *workID in dic[@"works"]){
            [set addObject:works[workID[@"objectId"]]];
        }
        ex.works = [[NSSet alloc] initWithSet:set];
        
        [exhibitions addObject:ex];
    }
    
    callback(exhibitions, nil);
}

- (NSArray *) loadJSON:(NSString *)json withError:(NSError **)error {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:json ofType:@"json"]];
    NSArray *raw = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    return raw;
}

@end
