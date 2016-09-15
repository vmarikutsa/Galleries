//
//  ExhibitionView.h
//  GoGallery
//
//  Created by Наталья on 13.09.16.
//  Copyright © 2016 goit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exhibition.h"

@interface ExhibitionView : UIView
@property (strong, nonatomic) Exhibition *currentExhibition;
@property (weak, nonatomic) IBOutlet UILabel *exhibitionName;

@end
