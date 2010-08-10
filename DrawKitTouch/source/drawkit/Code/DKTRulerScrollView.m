//
//  DKTRulerScrollView.m
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//
// UIScrollView subclass including NSScrollView style ruler support
//

#import "DKTRulerScrollView.h"

@implementation DKTRulerScrollView

@synthesize hasHorizontalRuler;
@synthesize hasVerticalRuler;
@synthesize rulersVisible;

- (void)awakeFromNib
{
   twlog("DKTRulerScrollView turning off delaysContentTouches and canCancelContentTouches");
   // one touch is always a drawing command, multiple always zoom
   self.delaysContentTouches = NO;
   // however, this has to be on for multiple touches to start dragging/zoooming?
   self.canCancelContentTouches = NO;
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
   // "Return NO if you don’t want the scroll view to send event messages to view. 
   // If you want view to receive those messages, return YES (the default)."
   
   if (1 == touches.count)
      // we'll make that always a drawing command
      return YES;
   
   return [super touchesShouldBegin:touches withEvent:event inContentView:view];
   //return NO;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
   // "YES to cancel further touch messages to view, NO to have view continue to receive those messages.
   // The default returned value is YES if view is not a UIControl object; otherwise, it returns NO."
   
   return [super touchesShouldCancelInContentView:view];
}

- (void)setRulersVisible:(BOOL)visible
{
   rulersVisible = visible;
   
   twlog("implement setRulersVisible: %@", visible ? @"YES" : @"NO");
}

@end
