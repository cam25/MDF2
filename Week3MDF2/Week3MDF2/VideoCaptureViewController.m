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
    
    NSURL *url = [videoData valueForKey:UIImagePickerControllerMediaURL];
    
    NSString *path = [url path];
    
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
    
    if (button.tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"Cancel");
    }
    else if (button.tag == 1)
    {
        
        NSURL *videoUrl = [videoData valueForKey:UIImagePickerControllerMediaURL];
        if (videoUrl != nil) {
            
            NSString *pathOfVideo = [videoUrl path];
            
            UISaveVideoAtPathToSavedPhotosAlbum(pathOfVideo, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
        //Save = YES;
        
        NSLog(@"Video Saved");
        
       
    }
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil) {
        
        NSLog(@"Error");
    }
    else if (error == nil)
{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Saved" message:
                     @"Video saved to the photo album" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
[view show];
}

}
@end
