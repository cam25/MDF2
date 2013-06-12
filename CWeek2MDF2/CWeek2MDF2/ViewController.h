//
//  ViewController.h
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/5/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    IBOutlet UICollectionView *theCollectionView;
     NSArray *twitterFeeds;
    NSDictionary *tweetDictionary;
   NSDictionary *tweet;
    NSArray *imageArray;
    NSArray *labelArray;
    NSArray *usersArray;
    NSMutableArray *userStorage;
    BOOL errorAlertToggle;
    BOOL noConnectAlert;
}
//-(void)getTweets;
-(void)alert;
@property (nonatomic,strong) UIImageView *backgroundImage;
@property (nonatomic,strong) UILabel *twitterHandle;
@property (nonatomic,strong) NSDictionary *tweetDictionary;
@property (nonatomic,strong) NSMutableArray *userStorage;
@property (nonatomic,strong) NSDictionary *tweet;
@property (nonatomic,strong)  NSArray *twitterFeeds;
//@property (nonatomic,strong) NSDictionary *friendList;


@end
