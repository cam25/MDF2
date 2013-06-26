//
//  DetailViewController.m
//  week4MDF2
//
//  Created by Cameron Mozie on 6/25/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "DetailViewController.h"
#import "MovieInfo.h"
#import "TheaterInfo.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize detailMovieImage,detailMovieTitle,detailShowTimes,movieArray,movieDetails;
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
    
    detailMovieTitle.text = movieDetails.movieName;
    detailMovieImage.image = image;
    detailShowTimes.text = [movieDetails timesForMovies];
    
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
    if (button.tag == 0) {
        
        // dismiss the view
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
