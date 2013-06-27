//
//  MovieInfo.h
//  week4MDF2
//
//  Created by Cameron Mozie on 6/24/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TheaterInfo.h"
@interface MovieInfo : NSObject
{
    
    //variables to hold the data for my object
    NSString *movieIcon;
    NSArray *movieTimes;
    NSString *movieName;
    NSURL *movieTrailer;
    TheaterInfo *movieLocation;
    
    
}
//method for my object to pass in my data
-(id)initWithTitle:(NSString*)icon mshowTimes:(NSArray*)showTimes names:(NSString*)movieTitle trailer:(NSURL*)trailerMov theaterLoc:(TheaterInfo*)theater;

//nsstring function that i have looping through my array of movie times
- (NSString*)timesForMovies;

//properties
@property(nonatomic,strong) NSString *movieIcon;
@property(nonatomic,strong) NSArray *movieTimes;
@property(nonatomic,strong) NSString *movieName;
@property(nonatomic,strong)NSURL *movieTrailer;
@property(nonatomic,strong)TheaterInfo *movieLocation;
@end
