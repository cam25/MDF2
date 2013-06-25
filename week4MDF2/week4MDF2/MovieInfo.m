//
//  MovieInfo.m
//  week4MDF2
//
//  Created by Cameron Mozie on 6/24/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "MovieInfo.h"

@implementation MovieInfo
@synthesize movieName,movieIcon,movieTimes,movieTrailer,movieLocation;

-(id)initWithTitle:(NSString*)icon mshowTimes:(NSArray*)showTimes names:(NSString*)movieTitle trailer:(NSURL*)trailerMov theaterLoc:(TheaterInfo *)theater{
    
    if ((self = [super init])) {
        
        //setters
        movieIcon = icon;
        movieTimes = showTimes;
        movieName = movieTitle;
        movieTrailer = trailerMov;
        movieLocation = theater;
        
        
        
        
        
    }
    return self;
    
}

//created method for setting of times for movies to be passed into cells via setting an empty string looping through the array of movie times and appending the string to the label.
- (NSString*)timesForMovies
{
    NSString* movieShowings = @"";
    
    if (movieTimes.count > 0) {
        for (int i = 0; i < movieTimes.count; i++) {
            NSString* showTime = [movieTimes objectAtIndex:i];
             movieShowings = [movieShowings stringByAppendingFormat:@"%@ ", showTime];
        }
    }
    
    return movieShowings;
}

@end
