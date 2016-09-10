//
//  Work.h
//  GoGallery
//
//  Created by Ivan on 9/4/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Work : NSObject
@property (nonatomic,strong) NSString *ID;
@property (nonatomic, strong) NSString *author;
@property (nonatomic,strong) NSURL *imgURL;

- (instancetype) initWithDictionary:(NSDictionary*) data;

@end
