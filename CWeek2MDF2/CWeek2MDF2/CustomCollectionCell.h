//
//  CustomCollectionCell.h
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/5/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollwerInfo.h"
@interface CustomCollectionCell : UICollectionViewCell
{
    //outlsets
    IBOutlet UIImageView *backgroundImage;
    IBOutlet UILabel *twitterHandle;
}
//method
-(void)refreshCellData:(UIImage*)image titleString:(NSString *)titleString;

@property FollwerInfo *info;
@property (nonatomic,strong) UIImageView *backgroundImage;
@property (nonatomic,strong) UILabel *twitterHandle;
@end
