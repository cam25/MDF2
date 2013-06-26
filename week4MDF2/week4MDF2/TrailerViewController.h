//
//  TrailerViewController.h
//  week4MDF2
//
//  Created by Cameron Mozie on 6/26/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MovieInfo.h"
#import "TheaterInfo.h"
#import "DetailViewController.h"
@interface TrailerViewController : UIViewController
{
    IBOutlet UILabel *movieTitle;
    MPMoviePlayerController *moviePlayer;
    IBOutlet UIView *movieView;
    IBOutlet UIImageView *movieImage;
}
-(IBAction)backClick:(id)sender;
-(IBAction)playStop:(id)sender;
@property (nonatomic,strong)MovieInfo *movieDetails;
@end
