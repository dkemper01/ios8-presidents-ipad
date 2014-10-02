//
//  SecondaryViewController.m
//  Presidents
//
//  Created by Station 1 on 5/25/14.
//  Copyright (c) 2014 The Kemper Group. All rights reserved.
//


#import "SecondaryViewController.h"
#import "DetailViewController.h"

@interface SecondaryViewController () {
    NSMutableArray *_objects;
}
@end

@implementation SecondaryViewController

@synthesize selectedObject = _selectedObject;
@synthesize presidents = _presidents;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    // UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    // self.navigationItem.rightBarButtonItem = addButton;
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // return _objects.count;
    return _presidents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SecondaryCell";

    UIImage *userImage = [UIImage imageNamed:@"111-user.png"];
	UIImage *badgeImage = [UIImage imageNamed:@"108-badge.png"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType =  UITableViewCellAccessoryDetailButton;
    
    // NSDate *object = _objects[indexPath.row];
    // cell.textLabel.text = [object description];
    
    NSDictionary *president = [_presidents objectAtIndex:indexPath.row];
    Boolean militaryService = [self hasMilitaryService:president];
    
    // Configure the cell.
    if (militaryService) {
        cell.imageView.image = badgeImage;
    } else {
        cell.imageView.image = userImage;
    }
    
    cell.textLabel.text = [president objectForKey:@"name"];
    
    return cell;
}

-(Boolean)hasMilitaryService:(NSDictionary *)selectedPresident {
    
    NSDictionary *presidentInfo = [selectedPresident objectForKey:@"info"];
    NSNumber *serviceNumber = [presidentInfo objectForKey: @"military_service"];
    Boolean hasMilitaryService = [serviceNumber boolValue];
    
    return hasMilitaryService;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSDate *object = _objects[indexPath.row];
    // self.detailViewController.detailItem = object;
    
    NSDictionary *president = [_presidents objectAtIndex:indexPath.row];
    self.detailViewController.detailItem = president;
}

@end
