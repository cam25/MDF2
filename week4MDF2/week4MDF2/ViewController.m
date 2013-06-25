//
//  ViewController.m
//  week4MDF2
//
//  Created by Cameron Mozie on 6/22/13.
//  Copyright (c) 2013 Cameron Mozie. All rights reserved.
//

#import "ViewController.h"
#import "MovieInfo.h"
#import "TheaterInfo.h"
#import "CustomTableViewCell.h"
#import "CustomHeaderLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
     
    movies = [[NSMutableArray alloc]init];
    theaters = [[NSMutableArray alloc]init];
    TheaterInfo *theater1 = [[TheaterInfo alloc]initWithTitle:@"Regal Hyattsville Royale 14" location:@"Hyattsvilee MD" image:[UIImage imageNamed:@"theater1.png"]];
    
    TheaterInfo *theater2 = [[TheaterInfo alloc]initWithTitle:@"AMC Magic Johnson Capital Center 12 " location:@"Largo MD" image:[UIImage imageNamed:@"theater2.png"]];
    
    TheaterInfo *theater3 = [[TheaterInfo alloc]initWithTitle:@"Academy 8" location:@"Greenbelt MD" image:[UIImage imageNamed:@"theater3.png"]];
    
    MovieInfo *movie1 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/disney/monstersuniversity/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"1:30PM",@"3:30PM",@"4:20PM", nil] names:@"Monsters University" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/disney/monstersuniversity/monstersuniversity-scaregames_r640s.mov"]theaterLoc:theater1];
    
    
    MovieInfo *movie2 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/paramount/worldwarz/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"4:05PM",@"5:30PM",@"7:30PM", nil] names:@"World War Z" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/paramount/worldwarz/worldwarz-clip2_r640s.mov"]theaterLoc:theater1];
    

    MovieInfo *movie3 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/wb/manofsteel/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:45PM",@"3:55PM",@"6:00PM", nil] names:@"Man Of Steel" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/manofsteel/manofsteel-tlr1b_r640s.mov"] theaterLoc:theater1];
    
    MovieInfo *movie4 = [[MovieInfo alloc] initWithTitle:@"http://trailers.apple.com/trailers/sony_pictures/thisistheend/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:20PM",@"4:50PM",@"7:40PM", nil] names:@"This Is The End" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/thisistheend/thisistheend-tlr_r640s.mov"] theaterLoc:theater1];
    
    MovieInfo *movie5 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/universal/thepurge/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:35PM",@"4:45",@"7:00PM", nil] names:@"The Purge" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/universal/thepurge/thepurge-tlr1_r640s.mov"] theaterLoc:theater1];
    
    
    [movies addObject:movie1];
    [movies addObject:movie2];
    [movies addObject:movie3];
    [movies addObject:movie4];
    [movies addObject:movie5];
    
    [theaters addObject:theater1];
    [theaters addObject:theater2];
    [theaters addObject:theater3];
    NSLog(@"%lu",(unsigned long)theaters.count);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    if (section == 0) {
        return 5;
    }
    
    else if (section == 1)
    {
        return 5;
    }
    else if (section == 2)
    {
        return 5;
        
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:self options:nil];
    CustomTableViewCell *cell = (CustomTableViewCell *) [nib objectAtIndex:0];
    
    if (cell != nil) {
        if ([indexPath section] == 0) {
             MovieInfo *info = [movies objectAtIndex:indexPath.row];
            
            NSURL *imageURL = [NSURL URLWithString:info.movieIcon];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];
        
       
        //NSLog(@"%@", info);
        cell.movieTitle.text = info.movieName;
            cell.movieImage.image = image;
            
            cell.movieTime.text = [info timesForMovies];
        //cell.textLabel.text = @"New text";
            
            
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *header = [[NSBundle mainBundle]loadNibNamed:@"CustomHeaderViewView" owner:self options:nil];
    CustomHeaderLabel *view = (CustomHeaderLabel *) [header objectAtIndex:0];
    TheaterInfo *theater = [theaters objectAtIndex:section];
    view.backgroundColor = [UIColor redColor];
    if (view) {
        if (section == 0) {
            UIImage *images = theater.theaterImage;
            NSString *tName = theater.nameOfTheater;
            NSString *tlocation = theater.locationOfTheater;
            
            view.theaterImage.image = images;
            view.theaterLocation.text = tlocation;
            view.theaterName.text = tName;
                        
        }
        
    }
    return view;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


@end
