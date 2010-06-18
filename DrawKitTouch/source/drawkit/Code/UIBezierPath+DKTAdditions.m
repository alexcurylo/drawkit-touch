///**********************************************************************************************************************************
///  UIBezierPath+DKTAdditions.m
///  DrawKit ©2005-2008 Apptree.net
///
///  UIBezierPath-based additions to emulate NSBezierPath by Alex Curylo
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

#import "UIColor+DKTAdditions.h"

/*
 static inline (NSBezierPath *) NSBezierPathFromCGPath ( CGPathRef pathRef );
 {
 NSBezierPath *path = [NSBezierPath bezierPath];
 if ( CGPathIsEmpty ( pathRef ))
 return path;
 
 // Supposing CGPathRef has a instance called "elements":
 for ( int elementIndex = 0; elementIndex < sizeof (pathRef.elements); elementIndex++ )
 {
 CGPathElement element = pathRef.elements[elementIndex];
 
 // Substitute CGPathRef's path methods with NSBezierPath's own.. 
 switch ( element.type )
 {
 case kCGPathElementMoveToPoint:
 [path moveToPoint: NSMakePoint ( element.point.x, element.point.y )]; 
 break;
 
 case kCGPathElementAddLineToPoint:
 break;
 
 case kCGPathElementAddQuadCurveToPoint:
 break;
 
 case kCGPathElementAddCurveToPoint:
 break;
 
 case kCGPathElementCloseSubpath:
 break;
 }
 }
 return path;
 }*/

@implementation UIBezierPath (DKTAdditions)

+ (void)clipRect:(CGRect)rect
{
   (void)rect;
   twlog("implement clipRect");
   // is -addClip related?
}

+ (CGFloat)defaultFlatness
{
   twlog("implement defaultFlatness");
   return 0;
}

+ (void)setDefaultFlatness:(CGFloat)newFlatness
{
   (void)newFlatness;
   twlog("implement setDefaultFlatness");
}

+ (CGFloat)defaultLineWidth
{
   twlog("implement defaultLineWidth");
   return 0;
}

+ (void)setDefaultLineWidth:(CGFloat)newLineWidth
{
   (void)newLineWidth;
   twlog("implement setDefaultLineWidth");
}

+ (void)strokeRect:(CGRect)rect
{
   (void)rect;
   twlog("implement strokeRect");
}

+ (void)strokeLineFromPoint:(CGPoint)point1 toPoint:(CGPoint)point2
{
   (void)point1;
   (void)point2;
   twlog("implement strokeLineFromPoint");
}

- (NSInteger)elementCount
{
   twlog("implement elementCount");
   // CGPathApply of use here?
   return 0;
}

- (UIBezierPath *)bezierPathByReversingPath
{
   twlog("implement bezierPathByReversingPath");
   // CGPathApply of use here?
   return [[self copy] autorelease];
}

- (UIBezierPath *)bezierPathByFlatteningPath
{
   twlog("implement bezierPathByReversingPath");
   // CGPathApply of use here?
   return [[self copy] autorelease];
}

- (NSBezierPathElement)elementAtIndex:(NSInteger)elementIndex associatedPoints:(CGPoint *)points
{
   (void)elementIndex;
   (void)points;
   twlog("implement elementAtIndex:associatedPoints");
   return kCGPathElementCloseSubpath;
}

- (NSBezierPathElement)elementAtIndex:(NSInteger)elementIndex
{
   (void)elementIndex;
   twlog("implement elementAtIndex");
   return kCGPathElementCloseSubpath;
}

- (void)setAssociatedPoints:(CGPoint *)points atIndex:(NSInteger)elementIndex;
{
   (void)elementIndex;
   (void)points;
   twlog("implement setAssociatedPoints:atIndex");
}

- (void)appendBezierPathWithArcFromPoint:(CGPoint)point1 toPoint:(CGPoint)point2 radius:(CGFloat)radius
{
   (void)point1;
   (void)point2;
   (void)radius;
   twlog("implement appendBezierPathWithArcFromPoint");
}

#pragma mark -
#pragma mark UIBezierPath emulations

- (CGRect)controlPointBounds
{
   return self.bounds;
}

- (void)lineToPoint:(CGPoint)point
{
   [self addLineToPoint:point];
}

- (void)relativeLineToPoint:(CGPoint)point
{
   CGPoint toPoint = self.currentPoint;
   toPoint.x += point.x;
   toPoint.y += point.y;
   [self addLineToPoint:toPoint];
}

- (void)curveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
{
   [self addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
}

- (void)appendBezierPath:(UIBezierPath *)path
{
   [self appendPath:path];
}

- (void)appendBezierPathWithRect:(CGRect)rect
{
   UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:rect];
   [self appendPath:rectPath];
}

- (void)appendBezierPathWithOvalInRect:(CGRect)rect
{
   UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:rect];
   [self appendPath:ovalPath];
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle
{
   [self appendBezierPathWithArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:NO];
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise
{
   UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
   [self appendPath:arcPath];
}

- (NSWindingRule)windingRule
{
   if (self.usesEvenOddFillRule)
      return NSEvenOddWindingRule;
   return NSNonZeroWindingRule;
}

- (void)setWindingRule:(NSWindingRule)windingRule
{
   self.usesEvenOddFillRule = NSEvenOddWindingRule == windingRule;
}

- (void)transformUsingAffineTransform:(DKTAffineTransform *)transform
{
   [self applyTransform:transform.transformStruct];
}

@end


