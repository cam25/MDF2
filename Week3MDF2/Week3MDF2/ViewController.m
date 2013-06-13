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

    UIImagePickerController *pickerController1 = [[UIImagePickerController alloc]init];
    if (pickerController1 != nil) {
        
        pickerController1.sourceType = UIImagePickerControllerCameraCaptureModePhoto;
        pickerController1.delegate = self;
        pickerController1.allowsEditing = YES;
        [self presentViewController:pickerController1 animated:YES completion:nil];
    }
    
    
}
-(IBAction)photoView:(id)sender
{
    UIImagePickerController *pickerController2 = [[UIImagePickerController alloc]init];
    if (pickerController2 != nil) {
        
        
        pickerController2.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerController2.delegate = self;
        pickerController2.allowsEditing = NO;
        [self presentViewController:pickerController2 animated:YES completion:nil];
    }
}



-(IBAction)videoRecord:(id)sender
{
    UIImagePickerController *pickerController3 = [[UIImagePickerController alloc]init];
    if (pickerController3 != nil) {
        
        pickerController3.sourceType = UIImagePickerControllerCameraCaptureModeVideo;
        pickerController3.delegate = self;
        pickerController3.allowsEditing = NO;
        [self presentViewController:pickerController3 animated:YES completion:nil];
    }
}
@end
