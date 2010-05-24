//
//  NSImage+DKAdditions.h
//  GCDrawKit
//
//  Created by graham on 9/04/10.
//  Copyright 2010 Apptree.net. All rights reserved.
//

// not in iPhone SDK, should be left to .pch ...alex
//#import <Cocoa/Cocoa.h>


@interface NSImage (DKAdditions)

+ (NSImage*)	imageFromImage:(NSImage*) srcImage withSize:(NSSize) size;
+ (NSImage*)	imageFromImage:(NSImage*) srcImage withSize:(NSSize) size fraction:(CGFloat) opacity allowScaleUp:(BOOL) scaleUp;

@end
