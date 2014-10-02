//
//  MasterViewController.h
//  Presidents
//
//  Created by Station 1 on 5/25/14.
//  Copyright (c) 2014 The Kemper Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SecondaryViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) SecondaryViewController *secondaryViewController;
@property (nonatomic, retain) NSArray *centuries;

@end
