//
//  ViewController.h
//  SearchBarTestExample
//
//  Created by Jon Verdi on 8/15/13.
//  Copyright (c) 2013 Selma Casteloes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong)IBOutlet UITableView *statesTV;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchDC;
@property (nonatomic, strong) NSArray *states;
@property (nonatomic, strong) NSArray *searchResult;

@end
