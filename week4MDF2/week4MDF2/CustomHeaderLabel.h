//
//  CustomHeaderLabel.h
//  week4MDF2
//
//  Created by Cameron Mozie on 6/24/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHeaderLabel : UIView
{
    IBOutlet UILabel *theaterName;
    IBOutlet UILabel *theaterLocation;
    IBOutlet UIImageView *theaterImage;
}
@property (nonatomic,strong) UILabel *theaterName;
@property (nonatomic,strong) UILabel *theaterLocation;
@property (nonatomic,strong) UIImageView *theaterImage;
@end
