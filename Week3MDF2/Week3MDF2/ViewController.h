//
//  ViewController.h
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/12/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    //outlet for image on main view
    IBOutlet UIImageView *photoImageView;
}
//actions for features
-(IBAction)capture:(id)sender;
-(IBAction)photoView:(id)sender;
-(IBAction)videoRecord:(id)sender;
@end
