//
//  DetailViewController.h
//  week4MDF2
//
//  Created by Cameron Mozie on 6/25/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"
#import "TheaterInfo.h"
@interface DetailViewController : UIViewController
{
    //varibles for passing the data too and displaying
    IBOutlet UIImageView *detailMovieImage;
    IBOutlet UILabel *detailMovieTitle;
    IBOutlet UILabel *detailShowTimes;
    
    
    NSArray *movieArray;
}

-(IBAction)backClick:(id)sender;
-(IBAction)trailerClick:(id)sender;

//this allows me to access my movie info object and use dot sytax to acess the data in this view.
@property (nonatomic,strong)MovieInfo *movieDetails;

//properties
@property (nonatomic,strong)UIImageView *detailMovieImage;
@property (nonatomic,strong)UILabel *detailMovieTitle;
@property (nonatomic,strong)UILabel *detailShowTimes;
@property (nonatomic,strong)NSArray *movieArray;
@end
