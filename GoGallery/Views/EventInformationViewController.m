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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contactsViewHeightConstr;
@property (assign, nonatomic) int _ConstContactsViewHeightConstr;
@property (assign, nonatomic) BOOL isExpanded;
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
    
    NSLog(@"Schedule count: %lu", (unsigned long)self.currentExhibition.venue.schedule.count);
    
    if (self.currentExhibition.venue.schedule.count > 0) {
        self.workingDaysLbl.text = self.currentExhibition.venue.schedule.firstObject;
        if (self.currentExhibition.venue.schedule.count > 1) {
            self.weekendDaysLbl.text = self.currentExhibition.venue.schedule.lastObject;
        } else {
            self.weekendDaysLbl.text = @"-";
        }
    } else{
        self.workingDaysLbl.text = @"-";
        self.weekendDaysLbl.text = @"-";
    }
    
    self.locationLbl.text = self.currentExhibition.venue.address;
    self.phoneLbl.text = self.currentExhibition.venue.phone;
    self.linkLbl.text = self.currentExhibition.venue.link.absoluteString;
    self.facebookLbl.text = self.currentExhibition.venue.facebook;
    
    self.galleryAboutLbl.text = self.currentExhibition.venue.about;
    
    __ConstContactsViewHeightConstr = self.contactsViewHeightConstr.constant;
    self.isExpanded = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)collapsContacts:(UIButton *)sender {
    
    self.contactsViewHeightConstr.constant = self.isExpanded ? 0 : __ConstContactsViewHeightConstr;
    
    __weak typeof(self) weakself = self;
    
    [UIView animateWithDuration:0.4 animations:^{
        [weakself.view layoutIfNeeded];
        weakself.contactsView.alpha = weakself.isExpanded ? 0.0 : 1.0;
    }];
    
    
    self.isExpanded = !self.isExpanded;
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
