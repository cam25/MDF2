//
//  TheaterInfo.h
//  week4MDF2
//
//  Created by Cameron Mozie on 6/24/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheaterInfo : NSObject
{
    //variables for holding theater data
    NSString *nameOfTheater;
    NSString *locationOfTheater;
    UIImage *theaterImage;
    
}
//method for passing my data into the object
-(id)initWithTitle:(NSString*)nameTheater location:(NSString*)theaterLoc image:(UIImage*)theaterPic;

//properties
@property (nonatomic,strong) NSString *nameOfTheater;
@property (nonatomic,strong) NSString *locationOfTheater;
@property (nonatomic,strong) UIImage *theaterImage;
@end
