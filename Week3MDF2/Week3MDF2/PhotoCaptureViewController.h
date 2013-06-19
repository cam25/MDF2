//
//  PhotoCaptureViewController.h
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/13/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCaptureViewController : UIViewController
{
    IBOutlet UIImageView *ogImage;
    IBOutlet UIImageView *scaleImage;
    NSDictionary *photoData;
    UIImage *originalPicture;
    UIImage *scaledPicture;
    
}

-(IBAction)onClick:(id)sender;
@property (nonatomic,strong )NSDictionary *photoData;
@end
