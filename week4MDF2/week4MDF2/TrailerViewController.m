//
//  TrailerViewController.m
//  week4MDF2
//
//  Created by Cameron Mozie on 6/26/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "TrailerViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface TrailerViewController ()

@end

@implementation TrailerViewController
@synthesize movieDetails;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSURL * imageURL = [NSURL URLWithString:movieDetails.movieIcon];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    
    movieImage.image = image;
    movieTitle.text = movieDetails.movieName;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backClick:(id)sender
{
     UIButton *button = (UIButton *)sender;
    
    if (button.tag == 2) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}

-(IBAction)playStop:(id)sender
{
     UIButton *button = (UIButton *)sender;
    NSURL *movieURL = movieDetails.movieTrailer;
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    
    if (button.tag == 0) {
        
        if (moviePlayer != nil)
        {
            [moviePlayer stop];
        }
        
    }
    else if (button.tag == 1)
    {
        [movieView addSubview:moviePlayer.view];
        moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, movieView.frame.size.width, movieView.frame.size.height);
        
        moviePlayer.fullscreen = NO;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
        
        [moviePlayer play];
        
        [moviePlayer stop];
        
    }
}


@end
