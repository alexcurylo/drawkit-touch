///**********************************************************************************************************************************
///  NSBezierPath-Geometry.h
///  DrawKit �2005-2008 Apptree.net
///
///  Created by graham on 22/10/2006.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

// not in iPhone SDK, should be left to .pch ...alex
//#import <Cocoa/Cocoa.h>

//@interface NSBezierPath (Geometry)
@interface DKBezierPath (Geometry)

// simple transformations

//- (NSBezierPath*)		scaledPath:(CGFloat) scale;
//- (NSBezierPath*)		scaledPath:(CGFloat) scale aboutPoint:(NSPoint) cp;
//- (NSBezierPath*)		rotatedPath:(CGFloat) angle;
//- (NSBezierPath*)		rotatedPath:(CGFloat) angle aboutPoint:(NSPoint) cp;
//- (NSBezierPath*)		insetPathBy:(CGFloat) amount;
//- (NSBezierPath*)		horizontallyFlippedPathAboutPoint:(NSPoint) cp;
//- (NSBezierPath*)		verticallyFlippedPathAboutPoint:(NSPoint) cp;
//- (NSBezierPath*)		horizontallyFlippedPath;
//- (NSBezierPath*)		verticallyFlippedPath;
- (DKBezierPath*)		scaledPath:(CGFloat) scale;
- (DKBezierPath*)		scaledPath:(CGFloat) scale aboutPoint:(NSPoint) cp;
- (DKBezierPath*)		rotatedPath:(CGFloat) angle;
- (DKBezierPath*)		rotatedPath:(CGFloat) angle aboutPoint:(NSPoint) cp;
- (DKBezierPath*)		insetPathBy:(CGFloat) amount;
- (DKBezierPath*)		horizontallyFlippedPathAboutPoint:(NSPoint) cp;
- (DKBezierPath*)		verticallyFlippedPathAboutPoint:(NSPoint) cp;
- (DKBezierPath*)		horizontallyFlippedPath;
- (DKBezierPath*)		verticallyFlippedPath;

- (NSPoint)				centreOfBounds;
- (CGFloat)				minimumCornerAngle;

// iterating over a path using a iteration delegate:

//- (NSBezierPath*)		bezierPathByIteratingWithDelegate:(id) delegate contextInfo:(void*) contextInfo;
- (DKBezierPath*)		bezierPathByIteratingWithDelegate:(id) delegate contextInfo:(void*) contextInfo;

//- (NSBezierPath*)		paralleloidPathWithOffset:(CGFloat) delta;
//- (NSBezierPath*)		paralleloidPathWithOffset2:(CGFloat) delta;
//- (NSBezierPath*)		paralleloidPathWithOffset22:(CGFloat) delta;
//- (NSBezierPath*)		offsetPathWithStartingOffset:(CGFloat) delta1 endingOffset:(CGFloat) delta2;
//- (NSBezierPath*)		offsetPathWithStartingOffset2:(CGFloat) delta1 endingOffset:(CGFloat) delta2;
- (DKBezierPath*)		paralleloidPathWithOffset:(CGFloat) delta;
- (DKBezierPath*)		paralleloidPathWithOffset2:(CGFloat) delta;
- (DKBezierPath*)		paralleloidPathWithOffset22:(CGFloat) delta;
- (DKBezierPath*)		offsetPathWithStartingOffset:(CGFloat) delta1 endingOffset:(CGFloat) delta2;
- (DKBezierPath*)		offsetPathWithStartingOffset2:(CGFloat) delta1 endingOffset:(CGFloat) delta2;

// interpolating flattened paths:

//- (NSBezierPath*)		bezierPathByInterpolatingPath:(CGFloat) amount;
- (DKBezierPath*)		bezierPathByInterpolatingPath:(CGFloat) amount;

// calculating a fillet

//- (NSBezierPath*)		filletPathForVertex:(NSPoint[]) vp filletSize:(CGFloat) fs;
- (DKBezierPath*)		filletPathForVertex:(NSPoint[]) vp filletSize:(CGFloat) fs;

// roughening and randomising paths

//- (NSBezierPath*)		bezierPathByRandomisingPoints:(CGFloat) maxAmount;
//- (NSBezierPath*)		bezierPathWithRoughenedStrokeOutline:(CGFloat) amount;
//- (NSBezierPath*)		bezierPathWithFragmentedLineSegments:(CGFloat) flatness;
- (DKBezierPath*)		bezierPathByRandomisingPoints:(CGFloat) maxAmount;
- (DKBezierPath*)		bezierPathWithRoughenedStrokeOutline:(CGFloat) amount;
- (DKBezierPath*)		bezierPathWithFragmentedLineSegments:(CGFloat) flatness;

// zig-zags and waves

//- (NSBezierPath*)		bezierPathWithZig:(CGFloat) zig zag:(CGFloat) zag;
//- (NSBezierPath*)		bezierPathWithWavelength:(CGFloat) lambda amplitude:(CGFloat) amp spread:(CGFloat) spread;
- (DKBezierPath*)		bezierPathWithZig:(CGFloat) zig zag:(CGFloat) zag;
- (DKBezierPath*)		bezierPathWithWavelength:(CGFloat) lambda amplitude:(CGFloat) amp spread:(CGFloat) spread;

// getting the outline of a stroked path:

//- (NSBezierPath*)		strokedPath;
//- (NSBezierPath*)		strokedPathWithStrokeWidth:(CGFloat) width;
- (DKBezierPath*)		strokedPath;
- (DKBezierPath*)		strokedPathWithStrokeWidth:(CGFloat) width;

// breaking a path apart:

- (NSArray*)			subPaths;
- (NSInteger)			countSubPaths;

// converting to and from Core Graphics paths

- (CGPathRef)			newQuartzPath;
- (CGMutablePathRef)	newMutableQuartzPath;
- (CGContextRef)		setQuartzPath;
- (void)				setQuartzPathInContext:(CGContextRef) context isNewPath:(BOOL) np;

//+ (NSBezierPath*)		bezierPathWithCGPath:(CGPathRef) path;
//+ (NSBezierPath*)		bezierPathWithPathFromContext:(CGContextRef) context;
+ (DKBezierPath*)		bezierPathWithCGPath:(CGPathRef) path;
+ (DKBezierPath*)		bezierPathWithPathFromContext:(CGContextRef) context;

// finding path lengths for points and points for lengths

- (NSPoint)				pointOnPathAtLength:(CGFloat) length slope:(CGFloat*) slope;
- (CGFloat)				slopeStartingPath;
- (CGFloat)				distanceFromStartOfPathAtPoint:(NSPoint) p tolerance:(CGFloat) tol;

- (NSInteger)			pointWithinPathRegion:(NSPoint) p;

// clipping utilities:

- (void)				addInverseClip;

// path trimming

- (CGFloat)				length;
- (CGFloat)				lengthWithMaximumError:(CGFloat) maxError;
- (CGFloat)				lengthOfElement:(NSInteger) i;
- (CGFloat)				lengthOfPathFromElement:(NSInteger) startElement toElement:(NSInteger) endElement;

- (NSPoint)				firstPoint;
- (NSPoint)				lastPoint;

// trimming utilities - modified source originally from A J Houghton, see copyright notice below

//- (NSBezierPath*)		bezierPathByTrimmingToLength:(CGFloat) trimLength;
//- (NSBezierPath*)		bezierPathByTrimmingToLength:(CGFloat) trimLength withMaximumError:(CGFloat) maxError;
- (DKBezierPath*)		bezierPathByTrimmingToLength:(CGFloat) trimLength;
- (DKBezierPath*)		bezierPathByTrimmingToLength:(CGFloat) trimLength withMaximumError:(CGFloat) maxError;

//- (NSBezierPath*)		bezierPathByTrimmingFromLength:(CGFloat) trimLength;
//- (NSBezierPath*)		bezierPathByTrimmingFromLength:(CGFloat) trimLength withMaximumError:(CGFloat) maxError;
- (DKBezierPath*)		bezierPathByTrimmingFromLength:(CGFloat) trimLength;
- (DKBezierPath*)		bezierPathByTrimmingFromLength:(CGFloat) trimLength withMaximumError:(CGFloat) maxError;

//- (NSBezierPath*)		bezierPathByTrimmingFromBothEnds:(CGFloat) trimLength;
//- (NSBezierPath*)		bezierPathByTrimmingFromBothEnds:(CGFloat) trimLength withMaximumError:(CGFloat) maxError;
- (DKBezierPath*)		bezierPathByTrimmingFromBothEnds:(CGFloat) trimLength;
- (DKBezierPath*)		bezierPathByTrimmingFromBothEnds:(CGFloat) trimLength withMaximumError:(CGFloat) maxError;

//- (NSBezierPath*)		bezierPathByTrimmingFromCentre:(CGFloat) trimLength;
//- (NSBezierPath*)		bezierPathByTrimmingFromCentre:(CGFloat) trimLength withMaximumError:(CGFloat) maxError;
- (DKBezierPath*)		bezierPathByTrimmingFromCentre:(CGFloat) trimLength;
- (DKBezierPath*)		bezierPathByTrimmingFromCentre:(CGFloat) trimLength withMaximumError:(CGFloat) maxError;

//- (NSBezierPath*)		bezierPathByTrimmingFromLength:(CGFloat) startLength toLength:(CGFloat) newLength;
//- (NSBezierPath*)		bezierPathByTrimmingFromLength:(CGFloat) startLength toLength:(CGFloat) newLength withMaximumError:(CGFloat) maxError;
- (DKBezierPath*)		bezierPathByTrimmingFromLength:(CGFloat) startLength toLength:(CGFloat) newLength;
- (DKBezierPath*)		bezierPathByTrimmingFromLength:(CGFloat) startLength toLength:(CGFloat) newLength withMaximumError:(CGFloat) maxError;

//- (NSBezierPath*)		bezierPathWithArrowHeadForStartOfLength:(CGFloat) length angle:(CGFloat) angle closingPath:(BOOL) closeit;
//- (NSBezierPath*)		bezierPathWithArrowHeadForEndOfLength:(CGFloat)length angle:(CGFloat) angle closingPath:(BOOL) closeit;
- (DKBezierPath*)		bezierPathWithArrowHeadForStartOfLength:(CGFloat) length angle:(CGFloat) angle closingPath:(BOOL) closeit;
- (DKBezierPath*)		bezierPathWithArrowHeadForEndOfLength:(CGFloat)length angle:(CGFloat) angle closingPath:(BOOL) closeit;

//- (void)				appendBezierPathRemovingInitialMoveToPoint:(NSBezierPath*) path;
- (void)				appendBezierPathRemovingInitialMoveToPoint:(DKBezierPath*) path;


@end



// informal protocol for iterating over the elements in a bezier path using bezierPathByIteratingWithDelegate:contextInfo:

@interface NSObject (BezierElementIterationDelegate)

//- (void)				path:(NSBezierPath*) path			// the new path that the delegate can build or modify from the information given
- (void)				path:(DKBezierPath*) path			// the new path that the delegate can build or modify from the information given
						elementIndex:(NSInteger) element			// the element index 
						type:(NSBezierPathElement) type		// the element type
						points:(NSPoint*) p					// list of associated points 0 = next point, 1 = cp1, 2 = cp2 (for curves), 3 = last point on subpath
						subPathIndex:(NSInteger) spi				// which subpath this is
						subPathClosed:(BOOL) spClosed		// is the subpath closed?
						contextInfo:(void*) contextInfo;	// the context info


@end

// undocumented Core Graphics:

extern CGPathRef	CGContextCopyPath( CGContextRef context );

/*
 * Bezier path utility category (trimming)
 *
 * (c) 2004 Alastair J. Houghton
 * All Rights Reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   1. Redistributions of source code must retain the above copyright
 *      notice, this list of conditions and the following disclaimer.
 *
 *   2. Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *
 *   3. The name of the author of this software may not be used to endorse
 *      or promote products derived from the software without specific prior
 *      written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT OWNER BE LIABLE FOR ANY DIRECT, INDIRECT,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */


//inline void subdivideBezierAtT(const NSPoint bez[4], NSPoint bez1[4], NSPoint bez2[4], CGFloat t);
// with gcc 4 'inline' should only appear in definition ...alex
void subdivideBezierAtT(const NSPoint bez[4], NSPoint bez1[4], NSPoint bez2[4], CGFloat t);

