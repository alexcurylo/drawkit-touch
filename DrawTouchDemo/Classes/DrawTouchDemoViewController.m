//
//  DrawTouchDemoViewController.m
//  DrawTouchDemo
//
//  Created by alex on 10-05-15.
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import "DrawTouchDemoViewController.h"

/*
// from DKDrawKit_Prefix.h

// the following includes code (in DKDrawableObject mostly) for assisting in visualizing and debugging graphical issues directly on screen. It can be included
// in release builds if you wish as each item controlled is still turned on/off at runtime.
#define qIncludeGraphicDebugging
// The following compile-time constants allow you to turn on the use of the various features that rely on independent licensing agreements. Comment out the definitions to refrain from using a given feature.
#define qUseCurveFit
// To use the Algorithm for Automatically Fitting Digitized Curves code, consult bezier-utils.h to ensure licensing compliance and uncomment the above definition. If you do not define the above constant, some methods will not be available.
#define qUseGPC
// To use the Generic Polygon Clipper code, consult gpc.h to ensure licensing compliance and uncomment the above definition. If you do not define the above constant, some methods will not be available, and others will default to a standard behavior that doesn't use GPC.
#define qUseLogEvent
// To use the LogEvent conditional logging, consult LogEvent.h to ensure licensing compliance and uncomment the above definition. If you do not define the above constant, the event logging will be dropped out of DrawKit.
#define qUsePotrace
// To use potrace, consult potracelib.h to ensure licensing compliance and uncomment the above definition. If you do not define the above constant, some methods will not be available.
*/

#import <DrawKitTouch/UIApplication+DKTAdditions.h>
#import <DrawKitTouch/DKDrawKit.h>


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
   if (DKTDrawKitTouchAvailable())
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
