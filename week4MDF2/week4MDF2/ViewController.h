//
//  ViewController.h
//  week4MDF2
//
//  Created by Cameron Mozie on 6/22/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    //variables 
    IBOutlet UITableView *mainTableView;
    
    //arrays for storing the data from the objects
    NSMutableArray *movies;
    NSMutableArray *theaters;
    NSMutableArray *movies2;
    NSMutableArray *movies3;
    NSMutableArray *allMovies;
}

@end
