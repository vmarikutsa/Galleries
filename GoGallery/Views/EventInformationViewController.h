//
//  EventInformationViewController.h
//  GoGallery
//
//  Created by Наталья on 15.09.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "ViewController.h"
#import "Event.h"
#import "Exhibition.h"

@interface EventInformationViewController : ViewController
@property (nonatomic, strong) Event *currentEvent;
@property (weak, nonatomic) IBOutlet UILabel *nameExhibitionLbl;
@property (weak, nonatomic) IBOutlet UILabel *nameAuthorLbl;
@property (weak, nonatomic) IBOutlet UILabel *datesExhibitionLbl;
@property (weak, nonatomic) IBOutlet UIImageView *galleryLogoImage;
@property (weak, nonatomic) IBOutlet UILabel *galleryNameLbl;

@end
