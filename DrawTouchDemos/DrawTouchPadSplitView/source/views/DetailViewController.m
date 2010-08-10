//
//  DetailViewController.m
//
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"


@interface DetailViewController ()

@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end



@implementation DetailViewController

@synthesize toolbar;
@synthesize popoverController;
@synthesize detailItem;
//@synthesize detailDescriptionLabel;
@synthesize drawingHolder;
@synthesize drawingView;

#pragma mark -
#pragma mark Life cycle

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
   (void)interfaceOrientation;
   
   return YES;
}

- (void)didReceiveMemoryWarning
 {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
   self.popoverController = nil;
   self.toolbar = nil;
   self.drawingView = nil;
   self.drawingHolder = nil;
}

- (void)dealloc
{
   [popoverController release];
   [toolbar release];

   [detailItem release];
   //[detailDescriptionLabel release];
   [drawingView release];
   [drawingHolder release];

   [super dealloc];
}

#pragma mark -
#pragma mark Managing the detail item

// When setting the detail item, update the view and dismiss the popover controller if it's showing.
- (void)setDetailItem:(id)newDetailItem
{
   twlog("setDetailItem: %@", newDetailItem);
   
   if (detailItem != newDetailItem)
   {
      [detailItem release];
      detailItem = [newDetailItem retain];
      
      // Update the view.
      [self configureView];
   }
   
   if (popoverController != nil)
   {
      [popoverController dismissPopoverAnimated:YES];
   }        
}

- (void)configureView
{
   // Update the user interface for the detail item.
   //detailDescriptionLabel.text = [detailItem description];   

   // this works through the undeclared NSObject -forwardInvocation method
	[(id)self.drawingView setDrawingToolWithName:self.detailItem];
}

#pragma mark -
#pragma mark UIPopoverControllerDelegate

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)thePopoverController
{
   (void)thePopoverController;
   twlog("popoverControllerShouldDismissPopover");
   return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)thePopoverController
{
   (void)thePopoverController;
   twlog("popoverControllerDidDismissPopover");
}

#pragma mark -
#pragma mark UISplitViewControllerDelegate

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
   (void)svc;
   (void)aViewController;
   (void)barButtonItem;
   
   NSMutableArray *items = [[toolbar items] mutableCopy];
   [items removeObjectAtIndex:0];
   [toolbar setItems:items animated:YES];
   [items release];
   self.popoverController = nil;
}

- (void)splitViewController: (UISplitViewController*)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem
       forPopoverController: (UIPopoverController*)pc
{
   (void)svc;
   (void)aViewController;
   
   barButtonItem.title = @"Root List";
   NSMutableArray *items = [[toolbar items] mutableCopy];
   [items insertObject:barButtonItem atIndex:0];
   [toolbar setItems:items animated:YES];
   [items release];
   self.popoverController = pc;
}

- (void)splitViewController: (UISplitViewController*)svc
          popoverController: (UIPopoverController*)pc
  willPresentViewController:(UIViewController *)aViewController
{
   (void)svc;
   (void)pc;
   (void)aViewController;
   twlog("willPresentViewController");
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("scrollViewDidScroll");
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("scrollViewDidZoom");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
   (void)scrollView;
   (void)decelerate;
   //twlog("scrollViewDidEndDragging willDecelerate:%d", decelerate);
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("scrollViewWillBeginDecelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("scrollViewDidEndDecelerating");
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("scrollViewDidEndScrollingAnimation");
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("viewForZoomingInScrollView, returning %@", self.drawingView);
   return self.drawingView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
   (void)scrollView;
   (void)view;
   //twlog("scrollViewWillBeginZooming: %@", view);
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
   (void)scrollView;
   (void)view;
   (void)scale;
   //twlog("scrollViewDidScroll: %@ to: %.03f", view, scale);
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("scrollViewShouldScrollToTop, returning YES");
   return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
   (void)scrollView;
   //twlog("scrollViewDidScrollToTop");
}

@end
