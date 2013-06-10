//
//  DetailViewController.h
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/9/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollwerInfo.h"
#import "CustomCollectionCell.h"
#import "ViewController.h"
@interface DetailViewController : UIViewController 
{
    IBOutlet UIImageView *userImage;
    IBOutlet UILabel *userNameLabel;
    FollwerInfo *info;
    
}
-(IBAction)backClick:(id)sender;
@property FollwerInfo *info;
@property (nonatomic,strong) UIImageView *userImage;
@property (nonatomic,strong) UILabel *userNameLabel;

@end
