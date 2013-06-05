//
//  ProfileViewController.m
//  Week1MDF2
//
//  Created by Cameron Mozie on 6/4/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ProfileViewController.h"
#import "DetailViewController.h"
#import "ViewController.h"
#import "CustomCellControllerCell.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize createdOn,followers,friends,description,profileImage,tweetFeed,tweets;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //variables which hold the data from my twitter dictionary
    NSString *nameText = [[tweetDictionary objectForKey:@"user"]objectForKey:@"name"];
    
    NSString *descript = [[tweetDictionary objectForKey:@"user"]objectForKey:@"description"];
    
    NSString *friendInfo = [[NSString alloc]initWithFormat:@"%@", [[tweetDictionary objectForKey:@"user"]objectForKey:@"friends_count"]];
    
    NSString *numTweets = [[NSString alloc] initWithFormat:@"%@",[[tweetDictionary objectForKey:@"user"] objectForKey:@"statuses_count"]];
    
    NSString *followersInfo = [[NSString alloc]initWithFormat:@"%@", [[tweetDictionary objectForKey:@"user"]objectForKey:@"followers_count"]];
    
    NSString *imageUrl = [[tweetDictionary objectForKey:@"user"]objectForKey:@"profile_image_url"];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    
    //setting the twitter data to be displayed inside my labels
    friends.text = friendInfo;
    followers.text = followersInfo;
    name.text = nameText;
    profileImage.image = [UIImage imageWithData:data];
    description.text = descript;
    tweets.text = numTweets;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated
{
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
