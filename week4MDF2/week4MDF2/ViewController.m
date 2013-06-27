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
#import "DetailViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //arrays that will be holding the data from the objects 
    movies = [[NSMutableArray alloc]init];
    movies2 = [[NSMutableArray alloc]init];
    movies3 = [[NSMutableArray alloc]init];
    allMovies = [[NSMutableArray alloc]init];
    //theater array
    theaters = [[NSMutableArray alloc]init];
    
    
    /////////--Theater Objects
    
    TheaterInfo *theater1 = [[TheaterInfo alloc]initWithTitle:@"Regal Hyattsville Royale 14" location:@"Hyattsvilee MD" image:[UIImage imageNamed:@"theater1.png"]];
    
    TheaterInfo *theater2 = [[TheaterInfo alloc]initWithTitle:@"AMC Magic Johnson Capital 12 " location:@"Largo MD" image:[UIImage imageNamed:@"theater2.png"]];
    
    TheaterInfo *theater3 = [[TheaterInfo alloc]initWithTitle:@"Academy 8" location:@"Greenbelt MD" image:[UIImage imageNamed:@"theater3.png"]];
    
    ////////--Movie Objects
    
    MovieInfo *movie1 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/disney/monstersuniversity/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"1:30PM",@"3:30PM",@"4:20PM", nil] names:@"Monsters University" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/disney/monstersuniversity/monstersuniversity-scaregames_r640s.mov"]theaterLoc:theater1];
    
    
    MovieInfo *movie2 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/paramount/worldwarz/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"4:05PM",@"5:30PM",@"7:30PM", nil] names:@"World War Z" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/paramount/worldwarz/worldwarz-clip2_r640s.mov"]theaterLoc:theater1];
    

    MovieInfo *movie3 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/wb/manofsteel/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:45PM",@"3:55PM",@"6:00PM", nil] names:@"Man Of Steel" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/manofsteel/manofsteel-tlr1b_r640s.mov"] theaterLoc:theater1];
    
    MovieInfo *movie4 = [[MovieInfo alloc] initWithTitle:@"http://trailers.apple.com/trailers/sony_pictures/thisistheend/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:20PM",@"4:50PM",@"7:40PM", nil] names:@"This Is The End" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/thisistheend/thisistheend-tlr_r640s.mov"] theaterLoc:theater1];
    
    MovieInfo *movie5 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/universal/thepurge/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:35PM",@"4:45PM",@"7:00PM", nil] names:@"The Purge" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/universal/thepurge/thepurge-tlr1_r640s.mov"] theaterLoc:theater1];
    
    MovieInfo *movie6 = [[MovieInfo alloc] initWithTitle:@"http://trailers.apple.com/trailers/sony_pictures/afterearth/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"10:10AM",@"11:30AM",@"1:00PM", nil] names:@"After Earth" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/sony_pictures/afterearth/afterearth-clip1_r640s.mov"] theaterLoc:theater2];
    
    MovieInfo *movie7 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/summit/nowyouseeme/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"3:55PM",@"6:45PM",@"10:55PM", nil] names:@"Now You See Me" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/summit/nowyouseeme/nowyouseeme-clip1_r640s.mov"] theaterLoc:theater2];
   
    MovieInfo *movie8 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/fox/epic/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:45PM",@"5:15PM",@"9:30PM", nil] names:@"Epic" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/fox/epic/epic-tvad-steven_r640s.mov"] theaterLoc:theater2];
    
    MovieInfo *movie9 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/universal/fastfurious6/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"3:45PM",@"7:05PM",@"10:05PM", nil] names:@"Fast & Furious 6" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/universal/fastandfurious6/fastandfurious6-musicmontage_r640s.mov"] theaterLoc:theater2];
    
    MovieInfo *movie10 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/independent/adore/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:10PM",@"7:50PM", @"9:05PM", nil] names:@"Adore" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/independent/adore/adore-tlr1_r640s.mov"] theaterLoc:theater2];
    
    
    MovieInfo *movie11 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/universal/despicableme2/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:30PM",@"4:05PM",@"7:15PM", nil] names:@"Despicable Me 2" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/universal/despicableme2/despicableme2-clip2_r640s.mov"] theaterLoc:theater3];
    
    MovieInfo *movie12 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/paramount/startrekintodarkness/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"3:00PM",@"4:20PM",@"7:45PM", nil] names:@"Star Trek Into Darkness" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/paramount/startrekintodarkness/startrekintodarkness-fte2_r640s.mov"] theaterLoc:theater3];
    
    MovieInfo *movie13 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/fox/theinternship/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"2:05PM",@"4:40PM",@"9:10PM", nil] names:@"The Internship" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/fox/theinternship/theinternship-tlr2_r640s.mov"] theaterLoc:theater3];
    
    MovieInfo *movie14 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/marvel/ironman3/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"1:15PM",@"3:15PM",@"6:15PM", nil] names:@"IronMan 3" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/marvel/ironman3/ironman3-clp_r640s.mov"] theaterLoc:theater3];

    MovieInfo *movie15 = [[MovieInfo alloc]initWithTitle:@"http://trailers.apple.com/trailers/wb/thehobbitthedesolationofsmaug/images/poster.jpg" mshowTimes:[NSArray arrayWithObjects:@"9:00AM",@"12:00PM",@"4:15PM", nil] names:@"Hobbit" trailer:[NSURL URLWithString:@"http://trailers.apple.com/movies/wb/thehobbit2/thehobbitdesolationofsmaug-tlr1_r640s.mov"] theaterLoc:theater3];
    
    ///////////////-----
    
    ///adding movies to arrays for each section
    [movies addObject:movie1];
    [movies addObject:movie2];
    [movies addObject:movie3];
    [movies addObject:movie4];
    [movies addObject:movie5];
 
    [movies2 addObject:movie6];
    [movies2 addObject:movie7];
    [movies2 addObject:movie8];
    [movies2 addObject:movie9];
    [movies2 addObject:movie10];
    
    [movies3 addObject:movie11];
    [movies3 addObject:movie12];
    [movies3 addObject:movie13];
    [movies3 addObject:movie14];
    [movies3 addObject:movie15];
    
    //added theater info objects to an array
    
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
    
    //loads the nib
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:self options:nil];
    CustomTableViewCell *cell = (CustomTableViewCell *) [nib objectAtIndex:0];
    
    if (cell != nil) {
        
        //if the index path section tag is 0 
        if ([indexPath section] == 0) {
            
            //created an info variable in my movieInfo object holding the indexPath of the movies in the first movies array
             MovieInfo *info = [movies objectAtIndex:indexPath.row];
            
            //allows the image url to be set as a data type and pulled accessed via string for viewing
            NSURL *imageURL = [NSURL URLWithString:info.movieIcon];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];
        
       
        //NSLog(@"%@", info);
            
            //passing of the data to my custom cells on my table view via my movies array at the index of my setter for movie name and image.
            cell.movieTitle.text = info.movieName;
            cell.movieImage.image = image;
            
            //setting the movie time to = the index of my timesForMovies function that loops through the arrays of times i have in my movie method and outputs to the movie time label
            cell.movieTime.text = [info timesForMovies];
            
            
        //cell.textLabel.text = @"New text";
            
            
        }else if ([indexPath section] == 1)
        {
             //created an info variable in my movieInfo object holding the indexPath of the movies in the first movies array
            MovieInfo *info2 = [movies2 objectAtIndex:indexPath.row];
            
          
           
            //passing of the data to my custom cells on my table view via my movies array at the index of my setter for movie name and image.
            NSURL *imageURL = [NSURL URLWithString:info2.movieIcon];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];
            
            cell.movieTitle.text = info2.movieName;
            cell.movieImage.image = image;
            
            //setting the movie time to = the index of my timesForMovies function that loops through the arrays of times i have in my movie method and outputs to the movie time label
            cell.movieTime.text = [info2 timesForMovies];
            
        }else if ([indexPath section] == 2)
        {
            
            //created an info variable in my movieInfo object holding the indexPath of the movies in the first movies array
            MovieInfo *info3 = [movies3 objectAtIndex:indexPath.row];
            
             //passing of the data to my custom cells on my table view via my movies array at the index of my setter for movie name and image.
            NSURL *imageURL = [NSURL URLWithString:info3.movieIcon];
            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
            UIImage *image = [UIImage imageWithData:imageData];
            
            //NSLog(@"%@", info);
            cell.movieTitle.text = info3.movieName;
            cell.movieImage.image = image;
            
            
            //setting the movie time to = the index of my timesForMovies function that loops through the arrays of times i have in my movie method and outputs to the movie time label
            cell.movieTime.text = [info3 timesForMovies];
            
        }
            
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   //setting the detail view up
    DetailViewController *detailView = [[DetailViewController alloc]initWithNibName:@"DetailView" bundle:nil];
    if (detailView != nil) {
     
        
        //i set a variables in my movies info object to hold the indexpath of each of the arrays to pass into each section
     MovieInfo *info = [movies objectAtIndex:indexPath.row];
     MovieInfo *info2 = [movies2 objectAtIndex:indexPath.row];
     MovieInfo *info3 = [movies3 objectAtIndex:indexPath.row];
        
        
        //if the index path of the section is = 0-2 then im passing the movie information to each specific section of the view
        if ([indexPath section] == 0) {
            
             detailView.movieDetails = info;
        }else if ([indexPath section] == 1)
        {
            detailView.movieDetails = info2;
        }else if ([indexPath section] == 2)
        {
            detailView.movieDetails = info3;
        }
       
        
        
         [self presentViewController:detailView animated:YES completion:nil];
        
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSArray *header = [[NSBundle mainBundle]loadNibNamed:@"CustomHeaderViewView" owner:self options:nil];
    
    //sets the variable view to hold the header
    CustomHeaderLabel *view = (CustomHeaderLabel *) [header objectAtIndex:0];
    
    //set the theater variable to be = to my theaters array at the index of the section
    TheaterInfo *theater = [theaters objectAtIndex:section];
    view.backgroundColor = [UIColor redColor];
    if (view) {
        
        //if the section == 0,1, or 2 then output the data for each section
        if (section == 0) {
            //parsing through the theater object and grabbing the image,name, and location from my theater object
            UIImage *images = theater.theaterImage;
            NSString *tName = theater.nameOfTheater;
            NSString *tlocation = theater.locationOfTheater;
            
            //setting images/location/name to the view
            view.theaterImage.image = images;
            view.theaterLocation.text = tlocation;
            view.theaterName.text = tName;
                        
        }else if (section == 1)
        {
            
            //setting the theater object at the index of 1 for second section
            TheaterInfo *theater = [theaters objectAtIndex:1];
            UIImage *images = theater.theaterImage;
            NSString *tName = theater.nameOfTheater;
            NSString *tlocation = theater.locationOfTheater;
            
            view.theaterImage.image = images;
            view.theaterLocation.text = tlocation;
            view.theaterName.text = tName;
            
        }else if (section == 2)
        {
            //setting the theater object at the index of 2 for the third section
            TheaterInfo *theater = [theaters objectAtIndex:2];
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
    //header height
    return 40;
}


@end
