//
//  DKRotationHandle.m
//  GCDrawKit
//
//  Created by graham on 4/09/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

#import "DKRotationHandle.h"


@implementation DKRotationHandle


+ (DKKnobType)			type
{
	return kDKRotationKnobType;
}


//+ (NSBezierPath*)		pathWithSize:(NSSize) size
+ (DKBezierPath*)		pathWithSize:(NSSize) size
{
	//return [NSBezierPath bezierPathWithOvalInRect:NSMakeRect( 0, 0, size.width, size.height )];
	return [DKBezierPath bezierPathWithOvalInRect:NSMakeRect( 0, 0, size.width, size.height )];
}


//+ (NSColor*)			fillColour
+ (DKColor*)			fillColour
{
	//return [NSColor purpleColor];
	return [DKColor purpleColor];
}


//+ (NSColor*)			strokeColour
+ (DKColor*)			strokeColour
{
	//return [NSColor whiteColor];
	return [DKColor whiteColor];
}


+ (CGFloat)				scaleFactor
{
	return 1.1;
}


@end


#pragma mark -



@implementation DKLockedRotationHandle


+ (DKKnobType)			type
{
	return kDKRotationKnobType | kDKKnobIsDisabledFlag;
}


@end


