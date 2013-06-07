//
//  FollwerInfo.m
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/6/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "FollwerInfo.h"
#import "ViewController.h"
#import "CustomCollectionCell.h"
@implementation FollwerInfo
@synthesize avatars,screenNames;

-(id)initWithTitle:(NSString *)names images:(UIImage *)profileImage
{
    if ((self = [super init])) {
        
        avatars = profileImage;
        screenNames = names;
      
    }
    return self;
}

@end
