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
    NSString *nameOfTheater;
    NSString *locationOfTheater;
    UIImage *theaterImage;
    
}

-(id)initWithTitle:(NSString*)nameTheater location:(NSString*)theaterLoc image:(UIImage*)theaterPic;

@property (nonatomic,strong) NSString *nameOfTheater;
@property (nonatomic,strong) NSString *locationOfTheater;
@property (nonatomic,strong) UIImage *theaterImage;
@end
