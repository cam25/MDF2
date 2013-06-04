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
    
}
-(IBAction)onClick:(id)sender;
@property (nonatomic,strong) NSDictionary *tweetDictionary;
@end
