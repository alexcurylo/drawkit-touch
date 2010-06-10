//
//  DKBoundingRectHandle.m
//  GCDrawKit
//
//  Created by graham on 4/09/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

#import "DKBoundingRectHandle.h"
#if TARGET_OS_IPHONE
#import "UIColor+DKTAdditions.h"
#endif TARGET_OS_IPHONE


@implementation DKBoundingRectHandle


+ (DKKnobType)			type
{
	return kDKBoundingRectKnobType;
}



//+ (NSColor*)			fillColour
+ (DKColor*)			fillColour
{
	//return [NSColor colorWithDeviceRed:0.5 green:0.9 blue:1.0 alpha:1.0];
	return [DKColor colorWithDeviceRed:0.5 green:0.9 blue:1.0 alpha:1.0];
}



//+ (NSColor*)			strokeColour
+ (DKColor*)			strokeColour
{
	//return [NSColor blackColor];
	return [DKColor blackColor];
}


+ (CGFloat)				scaleFactor
{
	return 0.9;
}


@end



#pragma mark -

@implementation DKLockedBoundingRectHandle


+ (DKKnobType)			type
{
	return kDKBoundingRectKnobType | kDKKnobIsDisabledFlag;
}



//+ (NSColor*)			fillColour
+ (DKColor*)			fillColour
{
	//return [NSColor whiteColor];
	return [DKColor whiteColor];
}



//+ (NSColor*)			strokeColour
+ (DKColor*)			strokeColour
{
	//return [NSColor grayColor];
	return [DKColor grayColor];
}


//- (void)				setColour:(NSColor*) colour
- (void)				setColour:(DKColor*) colour
{
#pragma unused(colour)
	[super setColour:nil];
}

@end


#pragma mark -

@implementation DKInactiveBoundingRectHandle


+ (DKKnobType)			type
{
	return kDKBoundingRectKnobType | kDKKnobIsInactiveFlag;
}



//+ (NSColor*)			fillColour
+ (DKColor*)			fillColour
{
	//return [NSColor lightGrayColor];
	return [DKColor lightGrayColor];
}



//+ (NSColor*)			strokeColour
+ (DKColor*)			strokeColour
{
	//return [NSColor grayColor];
	return [DKColor grayColor];
}


//- (void)				setColour:(NSColor*) colour
- (void)				setColour:(DKColor*) colour
{
#pragma unused(colour)
	[super setColour:nil];
}


@end

