//
//  NSAffineTransform+DKAdditions.m
///  DrawKit ©2005-2008 Apptree.net
//
//  Created by graham on 27/05/2008.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
//

#import "NSAffineTransform+DKAdditions.h"


//@implementation NSAffineTransform (DKAdditions)
@implementation DKAffineTransform (DKAdditions)

//- (NSAffineTransform*)		mapFrom:(NSRect) src to:(NSRect) dst
- (DKAffineTransform*)		mapFrom:(NSRect) src to:(NSRect) dst
{
#if TARGET_OS_IPHONE
   CGAffineTransform at;
	at.a = (dst.size.width/src.size.width);
	at.b = 0.0;
	at.tx = dst.origin.x - at.a*src.origin.x;
	at.c = 0.0;
	at.d = (dst.size.height/src.size.height);
	at.ty = dst.origin.y - at.d*src.origin.y;
#else
	NSAffineTransformStruct at;
	at.m11 = (dst.size.width/src.size.width);
	at.m12 = 0.0;
	at.tX = dst.origin.x - at.m11*src.origin.x;
	at.m21 = 0.0;
	at.m22 = (dst.size.height/src.size.height);
	at.tY = dst.origin.y - at.m22*src.origin.y;
#endif TARGET_OS_IPHONE
	[self setTransformStruct: at];
	return self;
}


//- (NSAffineTransform*)		mapFrom:(NSRect) src to:(NSRect) dst dstAngle:(CGFloat) radians
- (DKAffineTransform*)		mapFrom:(NSRect) src to:(NSRect) dst dstAngle:(CGFloat) radians
{
#if TARGET_OS_IPHONE
   CGAffineTransform at;
	at.a = (dst.size.width/src.size.width) * cosf( radians );
	at.b = sinf( radians );
	at.tx = dst.origin.x - at.a*src.origin.x;
	at.c = -sinf( radians );
	at.d = (dst.size.height/src.size.height) * cosf( radians );
	at.ty = dst.origin.y - at.d*src.origin.y;
#else
	NSAffineTransformStruct at;
	at.m11 = (dst.size.width/src.size.width) * cosf( radians );
	at.m12 = sinf( radians );
	at.tX = dst.origin.x - at.m11*src.origin.x;
	at.m21 = -sinf( radians );
	at.m22 = (dst.size.height/src.size.height) * cosf( radians );
	at.tY = dst.origin.y - at.m22*src.origin.y;
#endif TARGET_OS_IPHONE
	[self setTransformStruct: at];
	return self;
}


	/* create a transform that proportionately scales bounds to a rectangle of height
	centered distance units above a particular point.   */
//- (NSAffineTransform*)		scaleBounds:(NSRect) bounds toHeight:(CGFloat) height centeredDistance:(CGFloat) distance abovePoint:(NSPoint) location
- (DKAffineTransform*)		scaleBounds:(NSRect) bounds toHeight:(CGFloat) height centeredDistance:(CGFloat) distance abovePoint:(NSPoint) location
{
	NSRect dst = bounds;
	CGFloat scale = (height / dst.size.height);
	dst.size.width *= scale;
	dst.size.height *= scale;
	dst.origin.x = location.x - dst.size.width/2.0;
	dst.origin.y = location.y + distance;
	return [self mapFrom:bounds to:dst];
}

	/* create a transform that proportionately scales bounds to a rectangle of height
	centered distance units above the origin.   */
	
	
//- (NSAffineTransform*)		scaleBounds:(NSRect) bounds toHeight: (CGFloat) height centeredAboveOrigin:(CGFloat) distance
- (DKAffineTransform*)		scaleBounds:(NSRect) bounds toHeight: (CGFloat) height centeredAboveOrigin:(CGFloat) distance
{
	return [self scaleBounds: bounds toHeight: height centeredDistance:
			distance abovePoint: NSMakePoint(0,0)];
}


	/* initialize the NSAffineTransform so it will flip the contents of bounds
	vertically. */

//- (NSAffineTransform*)		flipVertical:(NSRect) bounds
- (DKAffineTransform*)		flipVertical:(NSRect) bounds
{
#if TARGET_OS_IPHONE
   CGAffineTransform at;
	at.a = 1.0;
	at.b = 0.0;
	at.tx = 0;
	at.c = 0.0;
	at.d = -1.0;
	at.ty = bounds.size.height;
#else
	NSAffineTransformStruct at;
	at.m11 = 1.0;
	at.m12 = 0.0;
	at.tX = 0;
	at.m21 = 0.0;
	at.m22 = -1.0;
	at.tY = bounds.size.height;
#endif TARGET_OS_IPHONE
	[self setTransformStruct: at];
	return self;
}

@end
