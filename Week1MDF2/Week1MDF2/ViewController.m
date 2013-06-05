//
//  ViewController.m
//  Week1MDF2
//
//  Created by Cameron Mozie on 6/3/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "CustomCellControllerCell.h"
#import "DetailViewController.h"
#import "ProfileViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tweetDictionary,tweetData;
- (void)viewDidLoad
{
    
    //ceates an account store instance
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
                            NSString *timelineString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            //SLrequest for twitter
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:timelineString] parameters:nil];
                          
                            //sets the request to users current active twitter account
                            if (request != nil) {
                                [request setAccount:currentAccount];
                                
                                //performs request
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
                                    
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200) {
                                        
                                        NSError *jsonError = nil;
                                        //parsing of twitter feed
                                        twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                        
                                        //causes tableview to trigger a reload
                                        [twitterTableView reloadData];
                                        if (twitterFeed != nil) {
                                            
                                            NSLog(@"%@", [twitterFeed description]);
                                            
                                            
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
                    errorAlertToggle = NO;
                   
                    NSLog(@"User did not allow access");
                }
                
            }];
        }
    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)refreshTweets
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil) {
        
        //sets the account type to twitter
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil) {
            
            //requests access based on if the user grants access via signing in to twitter on device
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted) {
                    
                    //sets show tweets to yes if account is granted for toggling of alert
                    errorAlertToggle = YES;
                    
                    //An array which holds the users twitter accounts.
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil) {
                        
                        //grabs the users current account at index 0
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil) {
                            
                            //twitter timeline api
                            NSString *timelineString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            //string with format of timeline string for easier specificity of users tweets
                            //NSString *timelineString =[NSString stringWithFormat:@"%@?%@&%@",@"https://api.twitter.com/1.1/statuses/user_timeline.json",@"screen_name=camsw0rld",@"count=10"];
                            //SLrequest for twitter
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:timelineString] parameters:nil];
                            
                            //sets the request to users current active twitter account
                            if (request != nil) {
                                [request setAccount:currentAccount];
                                
                                //performs request
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error){
                                    
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200) {
                                        
                                        NSError *jsonError = nil;
                                        //parsing of twitter feed
                                        twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                                        
                                        //causes tableview to trigger a reload
                                        [twitterTableView reloadData];
                                        if (twitterFeed != nil) {
                                            
                                            NSLog(@"%@", [twitterFeed description]);
                                            
                                        }
                                        
                                    }
                                    
                                }];
                            }
                            
                            
                            
                            NSLog(@"%@",currentAccount);
                        }
                        
                        //NSLog(@"%@", [twitterAccounts description]);
                        [self alert2];
                        
                    }
                    
                }else 
                {
                    //sets show tweets to no if access is not granted to fire the alert
                    errorAlertToggle = NO;
                    
                    //call alert if no user account
                    [self alert];
                    NSLog(@"User did not allow access");
                }
                
            }];
        }
    }
}

//height for custom cell
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}
//sets number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (twitterFeed != nil) {
        //returns amount of tweets to table view cells
        return [twitterFeed count];
    }
    return 0;
    
}

//date formatting
- (NSString*)dateFormat:(NSString *)formatter
{
    
    NSString *newDate = formatter;
    
    NSDateFormatter *stringDate = [[NSDateFormatter alloc] init];
    
    [stringDate setDateFormat:@"EEE MMM d HH:mm:ss Z y"];
    
    NSDate *date = [stringDate dateFromString:newDate];
        [stringDate setDateFormat:@"EEE MM dd yyyy hh:mm aaa"];
    
    newDate = [stringDate stringFromDate:date];
    
    //returns new date format
    return newDate;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //creates custom cell controller
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:self options:nil];
    CustomCellControllerCell *cell = (CustomCellControllerCell *)[nib objectAtIndex:0];
    
    if (cell != nil) {
        //creates variables to hold data pulled from twitter feed
        tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
        NSString *date = [tweetDictionary objectForKey:@"created_at"];
        NSString *imageUrl = [[tweetDictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        if (tweetDictionary != nil) {
            
            //objects in cell
            cell.imageView.image = [UIImage imageNamed:@"placeholder"];
            cell.tweetLabel.text = (NSString *)[tweetDictionary objectForKey:@"text"];
            cell.dateLabel.text = [NSString stringWithFormat:@"Created At: %@", [self dateFormat:date]];
            cell.imageView.image = [UIImage imageWithData:data];
            
        }
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //set this bool to yes to toggle between showing and not showing of fetch alert once detail view is visited and back button is clicked.
    fetchAlertToggle = YES;
    
    DetailViewController *viewController = [[DetailViewController alloc]initWithNibName:@"DetailView" bundle:nil];
    if (viewController != nil) {
        
        //creating dictionary for use on detail view.
         tweetData = [twitterFeed objectAtIndex:indexPath.row];
        
        //using dot syntax to access detail view
        viewController.tweetDictionary = tweetData;
        [self presentViewController:viewController animated:YES completion:nil];
    }
   
    

    
}

//on click of tool bar tabs
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
    //if refresh button is click execute the following code
    if (button.tag == 0)
    {
        //call for refresh alert
        [self alert2];
        
        //call for refresh
       [self refreshTweets];
       
        
        NSLog(@"refresh");
    
    //else if post button is clicked execute the post code
    }else if (button.tag == 1)
    {
        //setting compose variable to compose controller for posting tweets
        SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        if (slComposeViewController != nil) {
            
            //methods for setting text in tweet and images
            [slComposeViewController setInitialText:@"Posted From"];
            [slComposeViewController addImage:[UIImage imageNamed:@"nats.png"]];
            [self presentViewController:slComposeViewController animated:true completion:nil];
        }
        NSLog(@"post");
    }else if (button.tag == 2)
    {
        //By setting this bool to yes in the profile view allows me to setup a condtion to view an alert when i want.
        fetchAlertToggle = YES;
        
    ProfileViewController *profileViewController = [[ProfileViewController alloc]initWithNibName:@"ProfileView" bundle:nil];
        
        //setting tweet dictionary from my twitter feed
        NSDictionary *tweetDict = [twitterFeed objectAtIndex:0];
        if (tweetDict != nil) {
            
            //passing dictionary to profile view
            profileViewController.tweetDictionary = tweetDict;
            [self presentViewController:profileViewController animated:YES completion:nil];
        }
       
    
    }
}
-(void)alert
{
    //alert 
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please add a twitter account to your device." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
        [alertView show];
    


}
-(void)alert2
{
    //alert
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Refreshing Tweets..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(139.5, 75.5);
    [alertView addSubview:spinner];
    [spinner startAnimating];
    [alertView show];
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    // This condition is set so that once the user clicks profile button and then clicks the back button to return to the main table view the fetching tweets alert does not show. Respectfully so because going back does not refresh the tableview only onload or if the refresh button is clicked.
    if (fetchAlertToggle == NO) {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Fetching Tweets" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.center = CGPointMake(139.5, 75.5);
        [alertView addSubview:spinner];
        [spinner startAnimating];
        [alertView show];
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        
    }
    
    
    
    //toggles the alert to show if the user has not entered an account once the view appears
    if (errorAlertToggle == NO) {
        [self alert];
    }
    

    
}


@end
