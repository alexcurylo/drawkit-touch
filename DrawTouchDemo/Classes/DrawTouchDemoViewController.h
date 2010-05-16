//
//  DrawTouchDemoViewController.h
//  DrawTouchDemo
//
//  Created by alex on 10-05-15.
//  Copyright Trollwerks Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawTouchDemoViewController : UIViewController
{
   IBOutlet UILabel *versionLabel;
   IBOutlet UILabel *frameworkLabel;
   IBOutlet UIImageView *frameworkImage;
}

@property(nonatomic,retain)IBOutlet UILabel *versionLabel;
@property(nonatomic,retain)IBOutlet UILabel *frameworkLabel;
@property(nonatomic,retain)IBOutlet UIImageView *frameworkImage;

@end

