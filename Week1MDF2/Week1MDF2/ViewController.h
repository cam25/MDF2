//
//  ViewController.h
//  Week1MDF2
//
//  Created by Cameron Mozie on 6/3/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITabBarDelegate>
{
    NSArray *twitterFeed;
    IBOutlet UITableView *twitterTableView;
    NSDictionary *tweetDictionary;
    NSDictionary *tweetData;
    
    
}
-(IBAction)onClick:(id)sender;
-(void)refreshTweets;
- (NSString*)dateFormat:(NSString *)format;
@property (nonatomic,strong) NSDictionary *tweetDictionary;
@property (nonatomic,strong) NSDictionary *tweetData;

@end
