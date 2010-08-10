//
//  DrawTouchPadSplitViewAppDelegate.m
//
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import "DrawTouchPadSplitViewAppDelegate.h"
#import "RootViewController.h"
#import "DetailViewController.h"


@implementation DrawTouchPadSplitViewAppDelegate

@synthesize window, splitViewController, rootViewController, detailViewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
   (void)application;
   (void)launchOptions;

   twlog("launched %@ %@(%@)",
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"],
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],
      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
   );

   // Override point for customization after app launch.

   BOOL logging = NO;
   twlog("startup dktSetLogging:%@", logging ? @"YES" : @"NO");
   [application dktSetLogging:logging];

   // Add the split view controller's view to the window and display.
   [window addSubview:splitViewController.view];
   [window makeKeyAndVisible];

   return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
   (void)application;
   
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
   (void)application;
      
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application
{
   (void)application;

   [[NSUserDefaults standardUserDefaults] synchronize];

   /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
   (void)application;

   twlog("applicationDidReceiveMemoryWarning!! -- no action");
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc
{
   self.splitViewController = nil;
   self.rootViewController = nil;
   self.detailViewController = nil;
   self.window = nil;

   [super dealloc];
}


@end

