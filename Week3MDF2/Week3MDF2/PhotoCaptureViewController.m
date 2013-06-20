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
        
        //alert shown once cancel clicked
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel" message:
                              @"Cancelled Save" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        NSLog(@"CancelClicked");
        
        //dismisses view
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else if (button.tag == 1)
    {
        
        //saves the original image
        UIImageWriteToSavedPhotosAlbum(originalPicture, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
        // save the scaled image
        UIImageWriteToSavedPhotosAlbum(scaledPicture, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
       
    }
    
    
}
//when finished saving
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:
                              @"Error with image" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        // no errors, insert string into save log array
       
    }
    if (error == nil)
    {
       //save alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved" message:
                              @"Images Saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}
@end
