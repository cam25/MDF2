//
//  DetailViewController.m
//  CWeek2MDF2
//
//  Created by Cameron Mozie on 6/9/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "CustomCollectionCell.h"
#import "FollwerInfo.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize info,userNameLabel,userImage;
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
  
    userImage.image = info.avatars;
    userNameLabel.text = [NSString stringWithFormat:@"@%@",info.screenNames];
    
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
     UIButton *button = (UIButton*)sender;
    
    if (button.tag == 0) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
