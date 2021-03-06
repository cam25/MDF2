//
//  DetailViewController.h
//  Week1MDF2
//
//  Created by Cameron Mozie on 6/3/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"

typedef void (^CloseHandler)(NSDictionary*);
@interface DetailViewController : ViewController
{
    IBOutlet UIImageView *profileImage;
    IBOutlet UILabel *name;
    IBOutlet UILabel *twitterHandle;
    IBOutlet UILabel *createdOn;
    IBOutlet UITextView *tweetText;
    CloseHandler handler;

}
-(IBAction)backClick:(id)sender;
@property (nonatomic,strong) CloseHandler handler;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic, strong) UILabel *createdOn;
@property (nonatomic, strong) UITextView *tweetText;
@property (nonatomic, strong) UIImageView *profileImage;
@property (nonatomic, strong) UILabel *twtterHandle;
@end
