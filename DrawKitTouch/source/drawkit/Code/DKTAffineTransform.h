//
//  DKTAffineTransform.h
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//
// CoreGraphics analogue to NSAffineTransform
//

@interface DKTAffineTransform : NSObject
{
   CGAffineTransform transformStruct;
}

@property (nonatomic) CGAffineTransform transformStruct;

+ (DKTAffineTransform *)transform;

- (id)init;

- (void)translateXBy:(CGFloat)deltaX yBy:(CGFloat)deltaY;
- (void)scaleBy:(CGFloat)scale;
- (void)scaleXBy:(CGFloat)scaleX yBy:(CGFloat)scaleY;
- (void)rotateByRadians:(CGFloat)angle;
- (void)rotateByDegrees:(CGFloat)angle;
- (void)prependTransform:(DKTAffineTransform *)transform;
- (void)appendTransform:(DKTAffineTransform *)transform;
- (void)concat;
- (void)invert;

- (CGPoint)transformPoint:(CGPoint)aPoint;
- (CGSize)transformSize:(CGSize)aSize;
- (UIBezierPath *)transformBezierPath:(UIBezierPath *)aPath;

@end
