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

@end
