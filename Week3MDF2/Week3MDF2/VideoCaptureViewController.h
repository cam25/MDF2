//
//  VideoCaptureViewController.h
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/19/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCaptureViewController : UIViewController
{
    IBOutlet UITextView *videoText;
    NSDictionary *videoData;
    BOOL Save;
}
-(IBAction)onClick:(id)sender;
@property (nonatomic,strong)NSDictionary *videoData;
@end
