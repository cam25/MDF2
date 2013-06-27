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
    //labels/image views for displaying data
    IBOutlet UILabel *movieTitle;
    IBOutlet UIView *movieView;
    IBOutlet UIImageView *movieImage;
    
    //movie player controller to video playback
    MPMoviePlayerController *moviePlayer;
}
-(IBAction)backClick:(id)sender;
-(IBAction)playStop:(id)sender;

//allows me to access the movieInfo object
@property (nonatomic,strong)MovieInfo *movieDetails;
@end
