//
//  RootViewController.h
//
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController
{
   IBOutlet DetailViewController *detailViewController;

   IBOutlet UIView *tableHeaderView;
      IBOutlet UILabel *appVersionLabel;
      IBOutlet UILabel *dktVersionLabel;
   
   NSArray *toolNames;
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;
@property (nonatomic, retain) IBOutlet UIView *tableHeaderView;
@property (nonatomic, retain) IBOutlet UILabel *appVersionLabel;
@property (nonatomic, retain) IBOutlet UILabel *dktVersionLabel;
@property (nonatomic, retain) NSArray *toolNames;

#pragma mark -
#pragma mark Life cycle

- (void)viewDidLoad;
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
- (void)didReceiveMemoryWarning;
- (void)viewDidUnload;
- (void)dealloc;

#pragma mark -
#pragma mark Table support

- (NSString *)cellItemFor:(NSInteger)row;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView;
- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
