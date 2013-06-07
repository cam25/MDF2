//
//  CustomCollectionCell.h
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/5/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionCell : UICollectionViewCell
{
    IBOutlet UIImageView *backgroundImage;
    IBOutlet UILabel *twitterHandle;
}
-(void)refreshCellData:(UIImage*)image titleString:(NSString *)titleString;
@end
