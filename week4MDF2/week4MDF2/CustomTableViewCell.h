//
//  CustomTableViewCell.h
//  week4MDF2
//
//  Created by Cameron Mozie on 6/24/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
{
    IBOutlet UIImageView *movieImage;
    IBOutlet UILabel *movieTitle;
    IBOutlet UILabel *movieTime;
}
@property(nonatomic,strong) UIImageView *movieImage;
@property(nonatomic,strong) UILabel *movieTitle;
@property(nonatomic,strong) UILabel *movieTime;

@end
