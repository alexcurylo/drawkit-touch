//
//  DrawTouchDemoAppDelegate.m
//  DrawTouchDemo
//
//  Created by alex on 10-05-15.
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import "DrawTouchDemoAppDelegate.h"
#import "DrawTouchDemoViewController.h"

@implementation DrawTouchDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
