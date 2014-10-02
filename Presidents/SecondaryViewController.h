//
//  SecondaryViewController.h
//  Presidents
//
//  Created by Station 1 on 5/25/14.
//  Copyright (c) 2014 The Kemper Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface SecondaryViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSDate *selectedObject;
@property (nonatomic, retain) NSArray *presidents;

@end
