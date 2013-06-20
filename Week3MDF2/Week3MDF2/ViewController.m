//
//  ViewController.m
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/12/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCaptureViewController.h"
#import "VideoCaptureViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    //dismisses the picker controller views and allows the code to run on selected view
     [self dismissViewControllerAnimated:YES completion:^{
    
         
         //photo capture create
    PhotoCaptureViewController *photoCaptureView = [[PhotoCaptureViewController alloc]initWithNibName:@"PhotoCaptureView" bundle:nil];
                  
    NSLog(@"%@",[info description]);
         
  //sets selected image to hold the key of the original image in the info object
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage != nil) {
        
      
        //sets the image on the main view to selected image
        photoImageView.image = selectedImage;
        
        //passes the data to the created dictionary for use on photoviewcontroller
        photoCaptureView.photoData = info;
       
        [self presentViewController:photoCaptureView animated:YES completion:nil];
        
    } 
    
         
       
       //videoCapture create
         
         VideoCaptureViewController *videoCaptureView = [[VideoCaptureViewController
        alloc]initWithNibName:@"VideoCaptureView" bundle:nil];
         
    //creates a variable to hold the image url
    NSURL *urlstring = [info valueForKey:UIImagePickerControllerMediaURL];
    if (urlstring != nil) {
        
        //creates a variable to hold the path of the url for accessing and displaying in an image view
        NSString *videoPath = [urlstring path];
        NSLog(@"%@",videoPath);
        
        //passes the data to the created dictionary for use on photoviewcontroller
        videoCaptureView.videoData = info;
       [self presentViewController:videoCaptureView animated:YES completion:nil];
    }
         
         
         //photoAlbum
//         PhotoAlbumViewController *photoAlbum = [[PhotoAlbumViewController alloc]initWithNibName:@"PhotoAlbumView" bundle:nil];
//         if (photoAlbum != nil) {
//             
//             photoAlbum.images = info;
//             
//             [self presentViewController:photoAlbum animated:YES completion:nil];
//         }
        
      
     }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //dismisses on cancel
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)capture:(id)sender
{

    //creates an instance for the picker controller
    UIImagePickerController *pickerController1 = [[UIImagePickerController alloc]init];
    if (pickerController1 != nil) {
        
        //sets the image picker controller defaults 
        pickerController1.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerController1.delegate = self;
        pickerController1.allowsEditing = YES;
        
        //presents the camera
        [self presentViewController:pickerController1 animated:YES completion:nil];
    }
    
     
}




-(IBAction)photoView:(id)sender
{
    //creates an instance for the pickerController 
    UIImagePickerController *pickerController2 = [[UIImagePickerController alloc]init];
   
    if (pickerController2 != nil) {
        
       
        //sets the picker controller defaults
        pickerController2.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        //allows for videos to be seen in camera roll/photo album
        pickerController2.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeMovie, (NSString *)kUTTypeImage, nil];
        pickerController2.delegate = self;
        pickerController2.allowsEditing = YES;
        [self presentViewController:pickerController2 animated:YES completion:nil];
    }
    
  
    //[pickerController2 dismissViewControllerAnimated:YES completion:nil];
}



-(IBAction)videoRecord:(id)sender
{
    
    //creates an instance for the picker controller
    UIImagePickerController *pickerController3 = [[UIImagePickerController alloc]init];
    if (pickerController3 != nil) {
        
        //sets the type to video mode
        pickerController3.sourceType = UIImagePickerControllerCameraCaptureModeVideo;
        pickerController3.delegate = self;
        pickerController3.allowsEditing = NO;
        
        //sets the type of quality of video
        pickerController3.videoQuality = UIImagePickerControllerQualityTypeMedium;
        
        pickerController3.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeMovie, nil];
        [self presentViewController:pickerController3 animated:YES completion:nil];
    }
}

@end
