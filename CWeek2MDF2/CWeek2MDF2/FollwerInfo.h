//
//  FollwerInfo.h
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/6/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FollwerInfo : NSObject
{
    UIImage *avatars;
    NSString *screenNames;
}
-(id)initWithTitle:(NSString*)names images:(UIImage *)profileImage;

@property (strong,nonatomic) UIImage *avatars;
@property (strong,nonatomic) NSString *screenNames;
@end
