//
//  DrawTouchDemoViewController.m
//  DrawTouchDemo
//
//  Created by alex on 10-05-15.
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import "DrawTouchDemoViewController.h"
#import <DrawKitTouch/UIApplication+DKTAdditions.h>

@implementation DrawTouchDemoViewController

@synthesize versionLabel;
@synthesize frameworkLabel;
@synthesize frameworkImage;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
   [super viewDidLoad];

   NSString *version = [NSString stringWithFormat:@"%@ %@(%@)",
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"],
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
   ];
   self.versionLabel.text = version;

   NSString *sdkVersion = @"DrawKitTouch not linked!";
   if ([[UIApplication sharedApplication] respondsToSelector:@selector(dktVersion)])
      sdkVersion = [[UIApplication sharedApplication] dktVersion];
   self.frameworkLabel.text = sdkVersion;

   self.frameworkImage.image = [UIImage imageNamed:@"Rect.png"];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
   self.versionLabel = nil;
   self.frameworkLabel = nil;
   self.frameworkImage = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
