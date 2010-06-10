//
//  DKTShadow.m
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//
// CoreGraphics analogue to NSShadow
//

#import "DKTShadow.h"

@implementation DKTShadow

@synthesize shadowOffset;
@synthesize shadowColor;
@synthesize shadowBlurRadius;

- (id)copyWithZone:(NSZone *)zone
{
   DKTShadow *copy = [[[self class] allocWithZone:zone] init];
   
   copy.shadowOffset = self.shadowOffset;
   copy.shadowColor = self.shadowColor;
   copy.shadowBlurRadius = self.shadowBlurRadius;

   return copy;
}

- (void)set
{
#if TARGET_OS_IPHONE
	CGContextRef context = UIGraphicsGetCurrentContext();
#else
   CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
#endif TARGET_OS_IPHONE

   CGContextSetShadowWithColor(
      context,
      self.shadowOffset,
      self.shadowBlurRadius,
      self.shadowColor.CGColor
   );
}

@end
