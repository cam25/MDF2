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
     NSArray *followerInfo;
    NSDictionary *tweetDictionary;
   NSDictionary *tweet;
    NSArray *imageArray;
    NSArray *labelArray;
}
-(void)getTweets;
@property (nonatomic,strong) NSDictionary *tweetDictionary;
@property (nonatomic,strong) NSDictionary *tweet;
@property (nonatomic,strong)  NSArray *followerInfo;
//@property (nonatomic,strong) NSDictionary *friendList;


@end
