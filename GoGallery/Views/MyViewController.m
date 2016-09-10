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
    
   //NSURL *imgURL =[self.exhibitions objectAtIndex: indexPath.row] img
    //NSData *dataForImage = [[NSData alloc] initWithContentsOfURL: [self getURLForFirstWorkInExhibition: ]];
    NSString *str = [[NSBundle mainBundle] pathForResource: @"tfss-00af4fe9-a76e-4016-a2a5-b1334074b72d-nvas_resize" ofType:@"jpg"];
    NSURL *imgURL = [[NSURL alloc] initWithString:str];
    //NSData *dataForImage = [[NSData alloc] initWithContentsOfURL: imgURL];
    
    NSData *dataForImage = [NSData dataWithContentsOfURL:imgURL];
    
    [myCell.myCellImage setImage:[[UIImage alloc] initWithData: dataForImage]];

    //[myCell.myCellImage setImage:[[UIImage alloc] initWithContentsOfFile:str]];
    
    [self reloadInputViews];
    
    return myCell;
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
