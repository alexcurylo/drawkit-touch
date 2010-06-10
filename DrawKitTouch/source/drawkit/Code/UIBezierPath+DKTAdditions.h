///**********************************************************************************************************************************
///  UIBezierPath+DKTAdditions.h
///  DrawKit ©2005-2008 Apptree.net
///
///  UIBezierPath-based additions to emulate NSBezierPath by Alex Curylo
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

enum {
   NSMoveToBezierPathElement = kCGPathElementMoveToPoint,
   NSLineToBezierPathElement = kCGPathElementAddLineToPoint,
   //??? = kCGPathElementAddQuadCurveToPoint,
   NSCurveToBezierPathElement = kCGPathElementAddCurveToPoint,
   NSClosePathBezierPathElement = kCGPathElementCloseSubpath,
};
typedef NSUInteger NSBezierPathElement;

enum {
   NSNonZeroWindingRule = 0,
   NSEvenOddWindingRule = 1,
};
typedef NSUInteger NSWindingRule;

@interface UIBezierPath (DKTAdditions)

// stubs for the moment

+ (void)clipRect:(CGRect)rect;
+ (CGFloat)defaultFlatness;
+ (void)setDefaultFlatness:(CGFloat)newFlatness;
+ (CGFloat)defaultLineWidth;
+ (void)setDefaultLineWidth:(CGFloat)newLineWidth;
+ (void)strokeRect:(CGRect)rect;
+ (void)strokeLineFromPoint:(CGPoint)point1 toPoint:(CGPoint)point2;

- (NSInteger)elementCount;
- (UIBezierPath *)bezierPathByReversingPath;
- (UIBezierPath *)bezierPathByFlatteningPath;
- (NSBezierPathElement)elementAtIndex:(NSInteger)elementIndex associatedPoints:(CGPoint *)points;
- (NSBezierPathElement)elementAtIndex:(NSInteger)elementIndex;
- (void)setAssociatedPoints:(CGPoint *)points atIndex:(NSInteger)elementIndex;
- (void)appendBezierPathWithArcFromPoint:(CGPoint)point1 toPoint:(CGPoint)point2 radius:(CGFloat)radius;

#pragma mark -
#pragma mark UIBezierPath emulations

- (CGRect)controlPointBounds;

- (void)lineToPoint:(CGPoint)point;
- (void)relativeLineToPoint:(CGPoint)point;
- (void)curveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;

- (void)appendBezierPath:(UIBezierPath *)path;
- (void)appendBezierPathWithRect:(CGRect)rect;
- (void)appendBezierPathWithOvalInRect:(CGRect)rect;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle;
- (void)appendBezierPathWithArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;

- (NSWindingRule)windingRule;
- (void)setWindingRule:(NSWindingRule)windingRule;

- (void)transformUsingAffineTransform:(DKTAffineTransform *)transform;

@end
