//
//  RootViewController.m
//
//  Created by alex on 10-06-24.
//

#import "RootViewController.h"
#import "DetailViewController.h"

@implementation RootViewController

@synthesize detailViewController;
@synthesize tableHeaderView;
@synthesize appVersionLabel;
@synthesize dktVersionLabel;
@synthesize toolNames;

#pragma mark -
#pragma mark Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
   
   self.tableView.tableHeaderView = self.tableHeaderView;
   NSString *appVersion = [NSString stringWithFormat:@"%@ %@(%@)",
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"],
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
   ];
   self.appVersionLabel.text = appVersion;
   NSString *dktVersion = @"DrawKitTouch not linked!";
   if (DKTDrawKitTouchAvailable())
      dktVersion = [[UIApplication sharedApplication] dktVersion];
   self.dktVersionLabel.text = dktVersion;
   
   // from "DrawKitSimplerDemo"
   self.toolNames = [NSArray arrayWithObjects:
      @"Select",
      @"Rectangle",
      @"Oval",
      @"Path",
      @"Text",
      @"Arc",
      nil
   ];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
   (void)interfaceOrientation;

   return YES;
}

- (void)didReceiveMemoryWarning
{
   // Releases the view if it doesn't have a superview.
   [super didReceiveMemoryWarning];
   
   // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
   self.detailViewController = nil;
   self.tableHeaderView = nil;
   self.appVersionLabel = nil;
   self.dktVersionLabel = nil;
   self.toolNames = nil;
}

- (void)dealloc
{
   [self viewDidUnload];
   
   [super dealloc];
}


#pragma mark -
#pragma mark Table support

- (NSString *)cellItemFor:(NSInteger)row
{
   NSString *cellItem = [self.toolNames objectAtIndex:row];
   return cellItem;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView
{
   (void)aTableView;

   // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
   (void)section;
   (void)aTableView;

   // Return the number of rows in the section.
    return self.toolNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell.
    cell.textLabel.text = [self cellItemFor:indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   (void)aTableView;
   
     // When a row is selected, set the detail view controller's detail item to the item associated with the selected row.
    detailViewController.detailItem = [self cellItemFor:indexPath.row];
}

@end

