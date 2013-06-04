//
//  ProfileViewController.h
//  Week1MDF2
//
//  Created by Cameron Mozie on 6/4/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ProfileViewController : ViewController
{
    IBOutlet UILabel *name;
    IBOutlet UILabel *followers;
    IBOutlet UILabel *friends;
    IBOutlet UIImageView *profileImage;
    IBOutlet UILabel *description;
    NSDictionary *tweetFeed;
}
-(IBAction)backClick:(id)sender;
@property (nonatomic, strong) UILabel *followers;
@property (nonatomic, strong) UILabel *friends;
@property (nonatomic, strong) UILabel *createdOn;
@property (nonatomic, strong) UILabel *description;
@property (nonatomic, strong) UIImageView *profileImage;
@property (nonatomic, strong) NSDictionary *tweetFeed;
@end
