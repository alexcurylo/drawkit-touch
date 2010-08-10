//
//  DetailViewController.h
//
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DKTRulerScrollView;
@class DKTDrawingView;

@interface DetailViewController : UIViewController <
   UIPopoverControllerDelegate,
   UISplitViewControllerDelegate,
   UIScrollViewDelegate
>
{
   UIPopoverController *popoverController;
   IBOutlet UIToolbar *toolbar;

   id detailItem;
   //IBOutlet UILabel *detailDescriptionLabel;

   IBOutlet DKTRulerScrollView *drawingHolder;
   IBOutlet DKTDrawingView *drawingView;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) id detailItem;
//@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

@property (nonatomic, retain) IBOutlet DKTRulerScrollView *drawingHolder;
@property (nonatomic, retain) IBOutlet DKTDrawingView *drawingView;


// Life cycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
- (void)didReceiveMemoryWarning;
- (void)viewDidUnload;
- (void)dealloc;

// Managing the detail item

- (void)setDetailItem:(id)newDetailItem;
- (void)configureView;

// UIPopoverControllerDelegate

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)thePopoverController;
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)thePopoverController;

// UISplitViewControllerDelegate

- (void)splitViewController: (UISplitViewController*)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)splitViewController: (UISplitViewController*)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem
       forPopoverController: (UIPopoverController*)pc;
- (void)splitViewController: (UISplitViewController*)svc
          popoverController: (UIPopoverController*)pc
  willPresentViewController:(UIViewController *)aViewController;

// UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidZoom:(UIScrollView *)scrollView;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view;
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale;

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;

@end
