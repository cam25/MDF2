//
//  TheaterInfo.m
//  week4MDF2
//
//  Created by Cameron Mozie on 6/24/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "TheaterInfo.h"

@implementation TheaterInfo
@synthesize nameOfTheater,locationOfTheater,theaterImage;

-(id)initWithTitle:(NSString*)nameTheater location:(NSString*)theaterLoc image:(UIImage*)theaterPic
{
    if ((self = [super init])) {
        
        //setters
        nameOfTheater = nameTheater;
        locationOfTheater = theaterLoc;
        theaterImage = theaterPic;
        
        
        
    }
    return self;
}

@end
