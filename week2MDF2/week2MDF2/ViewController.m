//
//  ViewController.m
//  week2MDF2
//
//  Created by Cameron Mozie on 6/5/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"
#import "CollectionCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UINib *nib = [UINib nibWithNibName:@"customCollectionCellView" bundle:nil];
    
    if (nib != nil) {
        
        [theCollectionView registerNib:nib forCellWithReuseIdentifier:@"customCell"];
        
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    if (cell != nil) {
        
        
    }
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}



@end
