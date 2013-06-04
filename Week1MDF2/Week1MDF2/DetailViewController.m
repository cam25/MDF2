//
//  DetailViewController.m
//  Week1MDF2
//
//  Created by Cameron Mozie on 6/3/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize followers,friends,createdOn,tweetText,name,profileImage,handler;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        handler = nil;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    

    NSString *nameText = [[tweetDictionary objectForKey:@"user"]objectForKey:@"name"];
    NSString *tweet = [tweetDictionary objectForKey:@"text"];
    NSString *friendInfo = [[NSString alloc]initWithFormat:@"%@", [[tweetDictionary objectForKey:@"user"]objectForKey:@"friends_count"]];
    NSString *followersInfo = [[NSString alloc]initWithFormat:@"%@", [[tweetDictionary objectForKey:@"user"]objectForKey:@"followers_count"]];
    NSString *date = [tweetDictionary objectForKey:@"created_at"];
    NSString *imageUrl = [[tweetDictionary objectForKey:@"user"]objectForKey:@"profile_image_url"];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    
    name.text = nameText;
    tweetText.text = tweet;
    friends.text = friendInfo;
    followers.text = followersInfo;
    createdOn.text = date;
    profileImage.image = [UIImage imageWithData:data];
    
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
