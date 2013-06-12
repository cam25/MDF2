//
//  CustomCollectionCell.m
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/5/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "CustomCollectionCell.h"
#import "ViewController.h"
#import "FollwerInfo.h"
@implementation CustomCollectionCell
@synthesize backgroundImage,twitterHandle;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)refreshCellData:(UIImage*)image titleString:(NSString *)names
{
    //setting image/screename to variables for passing through views
    backgroundImage.image = image;
    twitterHandle.text = names;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
