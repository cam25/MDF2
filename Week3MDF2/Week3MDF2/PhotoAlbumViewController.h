//
//  PhotoAlbumViewController.h
//  Week3MDF2
//
//  Created by Cameron Mozie on 6/19/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoAlbumViewController : UIViewController
{
    IBOutlet UIImageView *photo;
    NSDictionary *images;
    
}
-(IBAction)backClick:(id)sender;
@property (nonatomic, strong)NSDictionary *images;
@end
