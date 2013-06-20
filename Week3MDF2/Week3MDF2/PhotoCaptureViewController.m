//
//  PhotoCaptureViewController.m
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/13/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "PhotoCaptureViewController.h"

@interface PhotoCaptureViewController ()

@end

@implementation PhotoCaptureViewController
@synthesize photoData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
 
    //original picture variable holding the data that was passed from info object on main view to dictionary on this view
    originalPicture = [photoData objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    if (ogImage != nil) {
        
        //setting the original picture to the image view
        ogImage.image = originalPicture;
        
    }
    //scaled picture variable holding the data that was passed from info object on main view to dictionary on this view
    scaledPicture = [photoData objectForKey:@"UIImagePickerControllerEditedImage"];
    
    if (scaleImage != nil) {
        
        //setting the scaled picture to the image view
        scaleImage.image = scaledPicture;
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    if (button.tag == 0) {
        
        NSLog(@"Back Clicked");
        
        //dismisses view
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else if (button.tag == 1)
    {
        //an alert view prompt added to prompt the user if they want to save both the images 
        UIAlertView *alertPrompt = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Are you sure you want to save both the Original image and the Scaled Image?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        
        [alertPrompt show];
    }
    
    
}

//set this up to allow the user to save after being prompted if they want to save or not 
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //if no is clicked nothing will save
    if (buttonIndex == 0)
    {
        NSLog(@"NO");
        
    } else if (buttonIndex == 1) //if yes is clicked save images
    {
        NSLog(@"YES");
        //saves the original image
        UIImageWriteToSavedPhotosAlbum(originalPicture, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        // save the scaled image
        UIImageWriteToSavedPhotosAlbum(scaledPicture, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
        //success alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:
                              @"Both Images were saved!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

//when finished saving
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    //if image is nil show error discription
    if (image == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:
                              @"Error Saving images!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
        NSLog(@"error %@", error.description);
        
    } else {
        NSLog(@"Both Images saved!");
    }
}
@end
