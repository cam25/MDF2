//
//  ViewController.m
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/5/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionCell.h"
#import "FollwerInfo.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize tweetDictionary,tweet,followerInfo;
- (void)viewDidLoad
{
    UINib *nib = [UINib nibWithNibName:@"CustomCollectionCellView" bundle:nil];
    if (nib != nil) {
        
        [theCollectionView registerNib:nib forCellWithReuseIdentifier:@"CustomCollectionCellView"];
        
    }
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
        //sets the account type to twitter
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            
            //requests access based on if the user grants access via signing in to twitter on device
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted) {
                    
                    //sets errorAlertToggle to yes if account is granted for toggling of the error alert
                    //errorAlertToggle = YES;
                    
                    //An array which holds the users twitter accounts.
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil) {
                        
                        //grabs the users current account at index 0
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil) {
                            
                            //twitter timeline api
                            //NSString *timelineString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            //string with format of timeline string for easier specificity of users tweets
                            NSString *friendList = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false&count=20";
                            //SLrequest for twitter
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:friendList] parameters:nil];
                            
                            //sets the request to users current active twitter account
                            if (request != nil) {
                                [request setAccount:currentAccount];
                                
                                //performs request
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
                                    
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200) {
                                        
                                        NSError *jsonError = nil;
                                        //parsing of twitter feed
                                        followerInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                        
                                        //causes tableview to trigger a reload
                                        //[twitterTableView reloadData];
                                        if (followerInfo != nil) {
                                            
                                           NSLog(@"%@", [followerInfo description]);
                                            
                                            
                                        }
                                        
                                    }
                                    
                                }];
                            }
                            
                            
                            
                            NSLog(@"%@",currentAccount);
                        }
                        
                        //NSLog(@"%@", [twitterAccounts description]);
                        
                    }
                    
                }else
                {
                    //sets errorAlertToggle bool to no if access is not granted to fire the alert. (see ViewDidAppear function)
                    //errorAlertToggle = NO;
                    
                    NSLog(@"User did not allow access");
                }
                
            }];
        }
        

    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getTweets
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
        //sets the account type to twitter
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            
            //requests access based on if the user grants access via signing in to twitter on device
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted) {
                    
                    //sets errorAlertToggle to yes if account is granted for toggling of the error alert
                    //errorAlertToggle = YES;
                    
                    //An array which holds the users twitter accounts.
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil) {
                        
                        //grabs the users current account at index 0
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil) {
                            
                            //twitter timeline api
                            //NSString *timelineString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            //string with format of timeline string for easier specificity of users tweets
                            NSString *friendList = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false&count=20";
                            //SLrequest for twitter
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:friendList] parameters:nil];
                            
                            //sets the request to users current active twitter account
                            if (request != nil) {
                                [request setAccount:currentAccount];
                                
                                //performs request
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
                                    
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200) {
                                        
                                        NSError *jsonError = nil;
                                        //parsing of twitter feed
                                        followerInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                        
                                        //causes tableview to trigger a reload
                                        //[twitterTableView reloadData];
                                        if (followerInfo != nil) {
                                            
                                            
                                            NSLog(@"%@", [followerInfo description]);
                                            
                                            
                                        }
                                        
                                    }
                                    
                                }];
                            }
                            
                            
                            
                            NSLog(@"%@",currentAccount);
                        }
                        
                        //NSLog(@"%@", [twitterAccounts description]);
                        
                    }
                    
                }else
                {
                    //sets errorAlertToggle bool to no if access is not granted to fire the alert. (see ViewDidAppear function)
                    //errorAlertToggle = NO;
                    
                    NSLog(@"User did not allow access");
                }
                
            }];
        }
    }
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionCell *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionCellView" forIndexPath:indexPath];
    if (cell != nil) {
        
       
      //tweetDictionary = [followerInfo objectAtIndex:indexPath.row];
        NSString *imageUrl = [[tweetDictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        
        
        
        //NSString *imageName = [NSString stringWithFormat:@"nat%d", ((indexPath.row % 3) + 1)];
        [cell refreshCellData:[UIImage imageNamed:@"nats.png"] titleString:[NSString stringWithFormat:@"cell %d", indexPath.row]];
        
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100.0f, 100.0f);
}

@end
