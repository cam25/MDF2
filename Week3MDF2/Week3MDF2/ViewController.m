//
//  ViewController.m
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/12/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCaptureViewController.h"
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
     [self dismissViewControllerAnimated:YES completion:^{
    
    PhotoCaptureViewController *photoCaptureView = [[PhotoCaptureViewController alloc]initWithNibName:@"PhotoCaptureView" bundle:nil];
         
         
    NSLog(@"%@",[info description]);
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage != nil) {
        
      
        photoImageView.image = selectedImage;
        
        photoCaptureView.photoData = info;
       
        [self presentViewController:photoCaptureView animated:YES completion:nil];
        
       
        
    }
         
         
    
    NSURL *urlstring = [info valueForKey:UIImagePickerControllerMediaURL];
    if (urlstring != nil) {
        
        NSString *videoPath = [urlstring path];
        NSLog(@"%@",videoPath);
        
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
     }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)capture:(id)sender
{

    UIImagePickerController *pickerController1 = [[UIImagePickerController alloc]init];
    if (pickerController1 != nil) {
        
        pickerController1.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerController1.delegate = self;
        pickerController1.allowsEditing = YES;
        [self presentViewController:pickerController1 animated:YES completion:nil];
    }
    
     
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil) {
        NSLog(@"Error saving file");
        
    }else {
        NSLog(@"Save Successful");
    }
}


-(IBAction)photoView:(id)sender
{
    UIImagePickerController *pickerController2 = [[UIImagePickerController alloc]init];
   
    if (pickerController2 != nil) {
        
       
        
        pickerController2.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickerController2.delegate = self;
        pickerController2.allowsEditing = YES;
        [self presentViewController:pickerController2 animated:YES completion:nil];
    }
  
    [pickerController2 dismissViewControllerAnimated:YES completion:nil];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil) {
        
        NSLog(@"Error Saving Image");
        
    }else {
        NSLog(@"Image Saved");
    }
}

-(IBAction)videoRecord:(id)sender
{
    UIImagePickerController *pickerController3 = [[UIImagePickerController alloc]init];
    if (pickerController3 != nil) {
        
        pickerController3.sourceType = UIImagePickerControllerCameraCaptureModeVideo;
        pickerController3.delegate = self;
        pickerController3.allowsEditing = NO;
        pickerController3.videoQuality = UIImagePickerControllerQualityTypeMedium;
        
        pickerController3.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeMovie, nil];
        [self presentViewController:pickerController3 animated:YES completion:nil];
    }
}

@end
