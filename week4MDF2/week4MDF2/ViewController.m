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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    movies = [[NSMutableArray alloc]init];
    theaters = [[NSMutableArray alloc]init];
    TheaterInfo *theater1 = [[TheaterInfo alloc]initWithTitle:@"Regal Hyattsville Royale 14" location:@"Hyattsvilee MD" image:[UIImage imageNamed:@"theater1.png"]];
    
    MovieInfo *movie1 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/disney/monstersuniversity/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"1:30PM",@"3:30PM",@"4:20PM", nil] names:@"Monsters University" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/disney/monstersuniversity/monstersuniversity-scaregames_r640s.mov"]theaterLoc:theater1];
    
    
    MovieInfo *movie2 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/paramount/worldwarz/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"4:05PM",@"5:30PM",@"7:30PM", nil] names:@"World War Z" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/paramount/worldwarz/worldwarz-clip2_r640s.mov"]theaterLoc:theater1];
    

    MovieInfo *movie3 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/wb/manofsteel/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:45PM",@"3:55PM",@"6:00PM", nil] names:@"Man Of Steel" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/manofsteel/manofsteel-tlr1b_r640s.mov"] theaterLoc:theater1];
    
    MovieInfo *movie4 = [[MovieInfo alloc] initWithTitle:@"http://trailers.apple.com/trailers/sony_pictures/thisistheend/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:20PM",@"4:50PM",@"7:40PM", nil] names:@"This Is The End" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/thisistheend/thisistheend-tlr_r640s.mov"] theaterLoc:theater1];
    
    MovieInfo *movie5 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/universal/thepurge/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:35",@"4:45",@"7:00PM", nil] names:@"The Purge" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/universal/thepurge/thepurge-tlr1_r640s.mov"] theaterLoc:theater1];
    
    
    [movies addObject:movie1];
    [movies addObject:movie2];
    [movies addObject:movie3];
    [movies addObject:movie4];
    [movies addObject:movie5];
    NSLog(@"%lu",(unsigned long)movies.count);
    
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
    
    static NSString *CellIdentifier = @"CustomCellView";
    CustomTableViewCell *cell = [mainTableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell != nil) {
        
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"section1";
        
    }else if (section == 1)
    {
        return @"section 2";
    }
    else if (section ==2)
    {
        return @"section3";
    }
    return nil;
}

@end
