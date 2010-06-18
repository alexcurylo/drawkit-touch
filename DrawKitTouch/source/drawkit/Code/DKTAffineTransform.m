//
//  DKTAffineTransform.m
//
//  Copyright 2010 Trollwerks Inc. All rights reserved.
//
// CoreGraphics analogue to NSAffineTransform
//

#import "DKTAffineTransform.h"

@implementation DKTAffineTransform

@synthesize transformStruct;

+ (DKTAffineTransform *)transform
{
   DKTAffineTransform *newTransform = [[[DKTAffineTransform alloc] init] autorelease];
   return newTransform;
}

- (id)init
{
	self = [super init];
	if (self)
	{
		transformStruct = CGAffineTransformIdentity;
	}
	return self;
}

- (void)translateXBy:(CGFloat)deltaX yBy:(CGFloat)deltaY
{
   transformStruct = CGAffineTransformMakeTranslation(deltaX, deltaY);
}

- (void)scaleBy:(CGFloat)scale
{
   [self scaleXBy:scale yBy:scale];
}

- (void)scaleXBy:(CGFloat)scaleX yBy:(CGFloat)scaleY
{
   transformStruct = CGAffineTransformMakeScale(scaleX, scaleY);
}

- (void)rotateByRadians:(CGFloat)angle
{
   transformStruct = CGAffineTransformRotate(transformStruct, angle);
}

- (void)rotateByDegrees:(CGFloat)angle
{
   CGFloat radians = DEGREES_TO_RADIANS(angle);
   [self rotateByRadians:radians];
}

- (void)prependTransform:(DKTAffineTransform *)transform
{
   transformStruct = CGAffineTransformConcat(transform.transformStruct, transformStruct);
}

- (void)appendTransform:(DKTAffineTransform *)transform
{
   transformStruct = CGAffineTransformConcat(transformStruct, transform.transformStruct);
}

- (void)concat
{
   CGContextConcatCTM(UIGraphicsGetCurrentContext(), transformStruct);
}

- (void)invert
{
   transformStruct = CGAffineTransformInvert(transformStruct);
}

- (CGPoint)transformPoint:(CGPoint)aPoint
{
   return CGPointApplyAffineTransform(aPoint, transformStruct);
}

- (CGSize)transformSize:(CGSize)aSize
{
   return CGSizeApplyAffineTransform(aSize, transformStruct);
}

- (UIBezierPath *)transformBezierPath:(UIBezierPath *)aPath
{
   UIBezierPath *newPath = [[aPath copy] autorelease];
   [newPath applyTransform:transformStruct];
   return newPath;
}

@end
