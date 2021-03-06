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
#import "DetailViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize tweetDictionary,tweet,twitterFeeds,userStorage,backgroundImage,twitterHandle;
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
                    errorAlertToggle = YES;
                    
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
                                        
                                        
                                        noConnectAlert = YES;
                                        NSError *jsonError = nil;
                                        //parsing of twitter feed
                                        tweetDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                        //refreshes the collection view
                                        [theCollectionView reloadData];
                                        
                                        //arrays holding tweet data
                                        usersArray = [tweetDictionary objectForKey:@"users"];
                                         userStorage = [[NSMutableArray alloc]init];
                                        
                                        //loops through the array of tweet data to pinpoint image / screenname keys
                                        for (int i=0; i<[usersArray count]; i++) {
                                            
                                            //NSLog(@"%@",tweetDictionary);
                                            
                                            //string variable storing all the images 
                                            NSString *imageUrl = [[usersArray objectAtIndex:i] objectForKey:@"profile_image_url"];
                                            
                                           // NSLog(@"%@",imageUrl);
                                            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
                                            
                                            //handle variable storing all the screen names
                                             NSString *handle = [[usersArray objectAtIndex:i]objectForKey:@"screen_name"];
                                            
                                            
                                            UIImage *avatar = [UIImage imageWithData:data];
                                            
                                            FollwerInfo *info = [[FollwerInfo alloc]initWithTitle:handle images:avatar];
                                            [userStorage addObject:info];
                                    
                                            
                                            
                                        
                                        }
                                    }else{
                                        //forces the alert to show on the main thread within the connection code block.
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"No Connection" message:
                                                                 @"Please obtain an internet connection." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                            [view show];
                                            
                                            
                                        });
                                        //[self alert];
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
                    errorAlertToggle = NO;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Add Twitter Account" message:
                                             @"Please add a twitter account on your device." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                        [view show];
                        
                        
                    });
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [userStorage count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //noConnectAlert = NO;
    CustomCollectionCell *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:@"CustomCollectionCellView" forIndexPath:indexPath];
    if (cell != nil) {
    
      
        if (tweetDictionary !=nil) {
            //setting the info variable in my follower object holding the users tweet info at the index path
             FollwerInfo *info = [userStorage objectAtIndex:indexPath.row];
            
        //used dot syntax to access the image/screennames that were set in followerinfo object by passing the info object into the refreshCellData method 
        [cell refreshCellData:info.avatars titleString:info.screenNames];
            
            //NSLog(@"%@",info);
        }
        
        
            
        return cell;
        

        //NSString *imageName = [NSString stringWithFormat:@"nat%d", ((indexPath.row % 3) + 1)];
        
        
    }
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100.0f, 100.0f);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc]initWithNibName:@"DetailView" bundle:nil];
    if (detailViewController != nil) {
        
        //sets the info variable to hold 
        FollwerInfo *info = [userStorage objectAtIndex:indexPath.row];
        
        //passes the data inside the info variable to the detail view
        detailViewController.info = info;
       
        [self presentViewController:detailViewController animated:YES completion:nil];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    //informs the user to add a twitter account
    if (errorAlertToggle == NO) {
    
    
   



}

}
-(void)alert
{
    //alert
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"No Connection" message:@"Please obtain an internet connection." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alertView show];
    
    
    
}



@end
