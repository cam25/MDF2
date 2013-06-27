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
#import "TrailerViewController.h"
#import "ViewController.h"
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
    
    //setting the image url to a data type to be able to show in image view
    NSURL * imageURL = [NSURL URLWithString:movieDetails.movieIcon];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    
    //passing of the data from the object to the labels/image view
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
-(IBAction)trailerClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if (button.tag == 1) {
        
        TrailerViewController *trailerView = [[TrailerViewController alloc]initWithNibName:@"TrailerView" bundle:nil];
        if (trailerView != nil) {
            
            //passing my movieDetails data via movieInfo object to the tailer view
            trailerView.movieDetails = movieDetails;
           
            [self presentViewController:trailerView animated:YES completion:nil];
            
        }
    }
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
