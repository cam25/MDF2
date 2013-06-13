//
//  ViewController.m
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/12/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"

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
    NSLog(@"%@",[info description]);
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage != nil) {
        photoImageView.image = selectedImage;
    }
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)capture:(id)sender
{

    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    if (pickerController != nil) {
        
        pickerController.sourceType = UIImagePickerControllerCameraCaptureModePhoto;
        pickerController.delegate = self;
        pickerController.allowsEditing = YES;
        [self presentViewController:pickerController animated:YES completion:nil];
    }
    
    
}
-(IBAction)photoView:(id)sender
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    if (pickerController != nil) {
        
        
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerController.delegate = self;
        pickerController.allowsEditing = NO;
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}



-(IBAction)videoRecord:(id)sender
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    if (pickerController != nil) {
        
        pickerController.sourceType = UIImagePickerControllerCameraCaptureModeVideo;
        pickerController.delegate = self;
        pickerController.allowsEditing = NO;
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}
@end
