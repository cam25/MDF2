//
//  CustomCellControllerCell.h
//  Week1MDF2
//
//  Created by Cameron Mozie on 6/3/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellControllerCell : UITableViewCell

{
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *dateLabel;
}
@property (nonatomic,strong) UILabel *tweetLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@end
