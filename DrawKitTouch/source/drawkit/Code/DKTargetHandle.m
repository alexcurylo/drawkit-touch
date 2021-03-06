//
//  DKTargetHandle.m
//  GCDrawKit
//
//  Created by graham on 4/09/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

#import "DKTargetHandle.h"
#import "NSBezierPath+Geometry.h"
#import "DKGeometryUtilities.h"
#if TARGET_OS_IPHONE
#import "UIColor+DKTAdditions.h"
#endif TARGET_OS_IPHONE


@implementation DKTargetHandle


+ (DKKnobType)			type
{
	return kDKCentreTargetKnobType;
}


//+ (NSBezierPath*)		pathWithSize:(NSSize) size
+ (DKBezierPath*)		pathWithSize:(NSSize) size
{
	//NSBezierPath*	path = nil;
	DKBezierPath*	path = nil;
	
	//path = [NSBezierPath bezierPath];
	path = [DKBezierPath bezierPath];
	NSSize	half;
	NSPoint	p = NSZeroPoint;
	
	half.width = size.width * 0.5;
	half.height = size.height * 0.5;
	
	p.y += half.height;
	[path moveToPoint:p];
	p.x += size.width;
	[path lineToPoint:p];
	
	p.y = 0;
	p.x = half.width;
	[path moveToPoint:p];
	p.y += size.height;
	[path lineToPoint:p];
	
	NSRect	tr = ScaleRect( NSMakeRect( 0, 0, size.width, size.height), 0.5 );
	[path appendBezierPathWithOvalInRect:tr];
	
	return path;
}


//+ (NSColor*)			fillColour
+ (DKColor*)			fillColour
{
	return nil;
}


//+ (NSColor*)			strokeColour
+ (DKColor*)			strokeColour
{
	//return [NSColor colorWithDeviceRed:0.5 green:0.9 blue:1.0 alpha:1.0];
	return [DKColor colorWithDeviceRed:0.5 green:0.9 blue:1.0 alpha:1.0];
}


+ (CGFloat)				scaleFactor
{
	return 2.5;
}



@end


#pragma mark -


@implementation DKLockedTargetHandle


+ (DKKnobType)			type
{
	return kDKCentreTargetKnobType | kDKKnobIsDisabledFlag;
}


- (void)	drawAtPoint:(NSPoint)point
{
#pragma unused(point)
	return;
}


- (BOOL)	hitTestPoint:(NSPoint)point inHandleAtPoint:(NSPoint)hp
{
#pragma unused(point, hp)
	return NO;
}

@end

