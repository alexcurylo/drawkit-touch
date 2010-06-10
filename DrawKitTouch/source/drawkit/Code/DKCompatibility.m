//
//  DKCompatibility.m
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//
//  Compatibility between NSGeometry and CGGeometry
//

#if TARGET_OS_IPHONE

void DKFrameRectWithWidth(CGRect aRect, CGFloat frameWidth)
{
   if (1.0 == frameWidth)
   {
      UIRectFrame(aRect);
   }
   else
   {
      twlog("need to implement DKFrameRectWithWidth (%d)!", frameWidth);
      
      // for now we'll just draw it at 1.0
      UIRectFrame(aRect);
      
      /* there's some mucking about to get this to draw as expected...
       // "Since the frame is drawn inside the rectangle, it will be visible even if drawing is clipped to the rectangle."
       aRect = CGRectInset(aRect, frameWidth, frameWidth);
       
       CGContextRef context = UIGraphicsGetCurrentContext();
       
       // "Because this function does not draw directly on the line, but rather inside it, it uses the current fill color (not stroke color) when drawing."
       // do we need to do something with fill/stroke colors here? Or maybe fill it with an internal mask?
       */                                       
   }
}

#endif TARGET_OS_IPHONE
