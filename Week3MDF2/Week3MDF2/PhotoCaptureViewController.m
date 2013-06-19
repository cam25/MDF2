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
    originalPicture = [photoData objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    if (ogImage != nil) {
        ogImage.image = originalPicture;
        
    }
    
    scaledPicture = [photoData objectForKey:@"UIImagePickerControllerEditedImage"];
    
    if (scaleImage != nil) {
        
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
        
        NSLog(@"BackClicked");
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else if (button.tag == 1)
    {
        UIImageWriteToSavedPhotosAlbum(originalPicture, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
        // save the scaled image
        UIImageWriteToSavedPhotosAlbum(scaledPicture, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        NSLog(@"save clicked");
    }
    
    
}
@end
