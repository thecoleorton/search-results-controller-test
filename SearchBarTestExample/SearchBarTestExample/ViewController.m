//
//  ViewController.m
//  SearchBarTestExample
//
//  Created by Jon Verdi on 8/15/13.
//  Copyright (c) 2013 Selma Casteloes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)filterSearchArray:(NSString *)searchText;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set the states array
    _states = @[@"Alaska", @"Arizona", @"Arkansas",
                @"California", @"Colorado", @"Connecticut",
                @"Delaware",
                @"Florida",
                @"Georgia",
                @"Hawaii",
                @"Idaho", @"Illinois", @"Indiana", @"Iowa",
                @"Kansas", @"Kentucky",
                @"Louisiana",
                @"Maine", @"Maryland", @"Massachusetts", @"Michigan",@"Minnesota", @"Mississippi", @"Missouri", @"Montana",
                @"Nebraska",@"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York",@"North Carolina", @"North Dakota",
                @"Ohio", @"Oklahoma", @"Oregon",
                @"Pennsylvania",
                @"Rhode Island",
                @"South Carolina", @"South Dakota",
                @"Tennessee", @"Texas",
                @"Utah",
                @"Vermont", @"Virginia",
                @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma mark - Custom class methods

- (void)filterSearchArray:(NSString *)searchText
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];
    _searchResult = [_states filteredArrayUsingPredicate:resultPredicate];
}
#pragma mark - Search display delegate methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterSearchArray:searchString];
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Check if we're in search mode. If we are, return the result rows
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [_searchResult count];
    }
    else
    {
        return [_states count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Check if we're in search mode. If we are, return the result rows
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [_searchResult objectAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text = [_states objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end
