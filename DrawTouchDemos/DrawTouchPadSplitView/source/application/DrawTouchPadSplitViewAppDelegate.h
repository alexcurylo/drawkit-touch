//
//  DrawTouchPadSplitViewAppDelegate.h
//
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RootViewController;
@class DetailViewController;

@interface DrawTouchPadSplitViewAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    
    UISplitViewController *splitViewController;
    
    RootViewController *rootViewController;
    DetailViewController *detailViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@end
