//
//  MyViewController.m
//  GoGallery
//
//  Created by GoIT on 9/7/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import "MyViewController.h"
#import "EventsModel.h"
#import "Exhibition.h"
#import "Event.h"
#import "MyCell.h"
//#import "<#header#>"

@interface MyViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray <Event *> *exhibitions;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.exhibitions = [EventsModel sharedModel].events;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.exhibitions count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyCell"];
    }

    MyCell *myCell = (MyCell *) cell;
    
    ///
    myCell.viewPanel.alpha = 0.8;
    myCell.viewPanel.backgroundColor = [UIColor blackColor];
    myCell.gallaryName.textColor = [UIColor whiteColor];
    myCell.exhibitionName.textColor = [UIColor greenColor];
    myCell.authorName.textColor = [UIColor greenColor];
    
    //
    
    Event *currentEvent = [self.exhibitions objectAtIndex: indexPath.row];
    
    NSURL *imgURL = [self getURLForFirstWorkInExhibition: currentEvent];
    
    NSData *dataForImage = [NSData dataWithContentsOfURL:imgURL];
    
    [myCell.myCellImage setImage:[[UIImage alloc] initWithData: dataForImage]];

    myCell.gallaryName.text = currentEvent.venue.name;
    myCell.exhibitionName.text = currentEvent.name;
    myCell.authorName.text = ((Exhibition *) currentEvent).authorName;
    //[self reloadInputViews];
    
    return myCell;
}

- (NSURL *) getURLForFirstWorkInExhibition: (Event *) event {
    NSURL *url = [[NSURL alloc] init];
    Exhibition *ex = (Exhibition *) event;
    for (Work *w in ex.works) {
        if (!(w.imgURL == nil)) {
            url = w.imgURL;
            break;
        }
    };
    
    return url;
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
