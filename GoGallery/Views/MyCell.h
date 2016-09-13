//
//  MyCell.h
//  GoGallery
//
//  Created by GoIT on 9/7/16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myCellImage;
@property (weak, nonatomic) IBOutlet UIView *viewPanel;
@property (weak, nonatomic) IBOutlet UILabel *gallaryName;
@property (weak, nonatomic) IBOutlet UILabel *exhibitionName;
@property (weak, nonatomic) IBOutlet UILabel *authorName;


@end
