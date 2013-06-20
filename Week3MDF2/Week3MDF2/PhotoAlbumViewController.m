//
//  PhotoAlbumViewController.m
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/19/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "PhotoAlbumViewController.h"

@interface PhotoAlbumViewController ()

@end

@implementation PhotoAlbumViewController
@synthesize images;
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
    UIImage *photoAlbumImage = [images objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    if (photoAlbumImage != nil) {
        
        photo.image = photoAlbumImage;
        
        
    }else if (!photoAlbumImage)
    {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Error" message:
                             @"Error Loading image" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [view show];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)backClick:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if (button.tag == 0) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
