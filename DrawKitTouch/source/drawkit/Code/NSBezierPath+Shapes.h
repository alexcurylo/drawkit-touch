//
//  NSBezierPath+Shapes.h
///  DrawKit ©2005-2008 Apptree.net
//
//  Created by graham on 08/01/2008.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
//

// not in iPhone SDK, should be left to .pch ...alex
//#import <Cocoa/Cocoa.h>


//@interface NSBezierPath (Shapes)
@interface DKBezierPath (Shapes)

/*
 // chains and sprockets

+ (NSBezierPath*)		bezierPathWithStandardChainLink;
+ (NSBezierPath*)		bezierPathWithStandardChainLinkFromPoint:(NSPoint) a toPoint:(NSPoint) b;
+ (NSBezierPath*)		bezierPathWithSprocketPitch:(CGFloat) pitch numberOfTeeth:(NSInteger) teeth;

// nuts and bolts

+ (NSBezierPath*)		bezierPathWithThreadedBarOfLength:(CGFloat) length diameter:(CGFloat) dia threadPitch:(CGFloat) pitch options:(NSUInteger) options;
+ (NSBezierPath*)		bezierPathWithThreadLinesOfLength:(CGFloat) length diameter:(CGFloat) dia threadPitch:(CGFloat) pitch;
+ (NSBezierPath*)		bezierPathWithHexagonHeadSideViewOfHeight:(CGFloat) height diameter:(CGFloat) dia options:(NSUInteger) options;
+ (NSBezierPath*)		bezierPathWithBoltOfLength:(CGFloat) length
									threadDiameter:(CGFloat) tdia
									threadPitch:(CGFloat) tpitch
									headDiameter:(CGFloat) hdia
									headHeight:(CGFloat) hheight
									shankLength:(CGFloat) shank
									options:(NSUInteger) options;

// crop marks, etc

+ (NSBezierPath*)		bezierPathWithCropMarksForRect:(NSRect) aRect length:(CGFloat) length extension:(CGFloat) ext;
+ (NSBezierPath*)		bezierPathWithCropMarksForRect:(NSRect) aRect extension:(CGFloat) ext;
*/

// chains and sprockets

+ (DKBezierPath*)		bezierPathWithStandardChainLink;
+ (DKBezierPath*)		bezierPathWithStandardChainLinkFromPoint:(NSPoint) a toPoint:(NSPoint) b;
+ (DKBezierPath*)		bezierPathWithSprocketPitch:(CGFloat) pitch numberOfTeeth:(NSInteger) teeth;

// nuts and bolts

+ (DKBezierPath*)		bezierPathWithThreadedBarOfLength:(CGFloat) length diameter:(CGFloat) dia threadPitch:(CGFloat) pitch options:(NSUInteger) options;
+ (DKBezierPath*)		bezierPathWithThreadLinesOfLength:(CGFloat) length diameter:(CGFloat) dia threadPitch:(CGFloat) pitch;
+ (DKBezierPath*)		bezierPathWithHexagonHeadSideViewOfHeight:(CGFloat) height diameter:(CGFloat) dia options:(NSUInteger) options;
+ (DKBezierPath*)		bezierPathWithBoltOfLength:(CGFloat) length
threadDiameter:(CGFloat) tdia
threadPitch:(CGFloat) tpitch
headDiameter:(CGFloat) hdia
headHeight:(CGFloat) hheight
shankLength:(CGFloat) shank
options:(NSUInteger) options;

// crop marks, etc

+ (DKBezierPath*)		bezierPathWithCropMarksForRect:(NSRect) aRect length:(CGFloat) length extension:(CGFloat) ext;
+ (DKBezierPath*)		bezierPathWithCropMarksForRect:(NSRect) aRect extension:(CGFloat) ext;

@end


// options:


enum
{
	kThreadedBarLeftEndCapped			= 1 << 0,
	kThreadedBarRightEndCapped			= 1 << 1,
	kThreadedBarThreadLinesDrawn		= 1 << 2,
	kFastenerCentreLine					= 1 << 3,
	kFastenerHasCapHead					= 1 << 4,
	kHexFastenerFaceCurvesDrawn			= 1 << 5
};


/*

A category on NSBezierPath for creating various unusual shape paths, particularly for engineering use

*/
