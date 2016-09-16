//
//  EventInformationViewController.m
//  GoGallery
//
//  Created by Наталья on 15.09.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "EventInformationViewController.h"
#import "Exhibition.h"
#import "NSDate+NSDate_DateConvertor.h"


@interface EventInformationViewController ()
@property (strong) Exhibition *currentExhibition;
@end

@implementation EventInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentExhibition = (Exhibition *) self.currentEvent;
    self.nameExhibitionLbl.text = self.currentExhibition.name;
    self.nameAuthorLbl.text = self.currentExhibition.authorName;
    
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendString:[self.currentExhibition.dateStart strDate]];
    [str appendString:@" - "];
    [str appendString:[self.currentExhibition.dateEnd strDate]];
    self.datesExhibitionLbl.text = str;
    
    NSData *imageData = [NSData dataWithContentsOfURL:self.currentExhibition.venue.logo];
    UIImage *logoImage = [[UIImage alloc] initWithData:imageData];
    [self.galleryLogoImage setImage:logoImage];
    
    self.galleryNameLbl.text = self.currentExhibition.venue.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
