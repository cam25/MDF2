//
//  VideoCaptureViewController.m
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/19/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "VideoCaptureViewController.h"

@interface VideoCaptureViewController ()

@end

@implementation VideoCaptureViewController
@synthesize videoData;
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
    //url variable holding data passed from info object "media Url" on main view 
    NSURL *url = [videoData valueForKey:UIImagePickerControllerMediaURL];
    
    //string holding the url path
    NSString *path = [url path];
    
    //shows text in textfield
    videoText.text = path;

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
    //cancel button
    if (button.tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"Cancel");
    }
    //save button
    else if (button.tag == 1)
    {
        //url variable holding data passed from info object "media Url" on main view 
        NSURL *videoUrl = [videoData valueForKey:UIImagePickerControllerMediaURL];
        if (videoUrl != nil) {
            
            
            //string holding the url path
            NSString *pathOfVideo = [videoUrl path];
            
            //saving of video to photo album
            UISaveVideoAtPathToSavedPhotosAlbum(pathOfVideo, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
        //Save = YES;
        
        NSLog(@"Video Saved");
        
       
    }
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil) {
        
        //error alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:
                              @"Error with video" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    //alert for saving
    else if (error == nil)
{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Saved" message:
                     @"Video saved to the photo album" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
[view show];
}

}
@end
