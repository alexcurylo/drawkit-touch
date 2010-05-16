//
//  DrawTouchDemoAppDelegate.h
//  DrawTouchDemo
//
//  Created by alex on 10-05-15.
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawTouchDemoViewController;

@interface DrawTouchDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DrawTouchDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DrawTouchDemoViewController *viewController;

@end

