//
//  DKDrawableShape+Utilities.h
//  GCDrawKit
//
//  Created by graham on 13/06/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

// not in iPhone SDK, should be left to .pch ...alex
//#import <Cocoa/Cocoa.h>
#import "DKDrawableShape.h"


@interface DKDrawableShape (Utilities)

// utilities for calculating regions within a shape and drawing images allowing
// for scale, rotation, etc.

//- (NSBezierPath*)			pathWithRelativeRect:(NSRect) relRect;
//- (NSBezierPath*)			pathWithRelativePosition:(NSPoint) relLoc finalSize:(NSSize) size;
//- (NSBezierPath*)			pathWithFinalSize:(NSSize) size offsetBy:(NSPoint) offset fromPartcode:(NSInteger) pc;
//- (NSBezierPath*)			path:(NSBezierPath*) inPath withFinalSize:(NSSize) size offsetBy:(NSPoint) offset fromPartcode:(NSInteger) pc;
- (DKBezierPath*)			pathWithRelativeRect:(NSRect) relRect;
- (DKBezierPath*)			pathWithRelativePosition:(NSPoint) relLoc finalSize:(NSSize) size;
- (DKBezierPath*)			pathWithFinalSize:(NSSize) size offsetBy:(NSPoint) offset fromPartcode:(NSInteger) pc;
- (DKBezierPath*)			path:(DKBezierPath*) inPath withFinalSize:(NSSize) size offsetBy:(NSPoint) offset fromPartcode:(NSInteger) pc;

- (NSPoint)					pointForRelativeLocation:(NSPoint) relLoc;


@end
