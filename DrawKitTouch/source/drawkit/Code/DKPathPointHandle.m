//
//  DKPathPointHandle.m
//  GCDrawKit
//
//  Created by graham on 4/09/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

#import "DKPathPointHandle.h"


@implementation DKOnPathPointHandle


+ (DKKnobType)			type
{
	return kDKOnPathKnobType;
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
	//return [NSColor orangeColor];
	return [DKColor orangeColor];
}



//+ (NSColor*)			strokeColour
+ (DKColor*)			strokeColour
{
	return nil;
}


+ (CGFloat)				scaleFactor
{
	return 0.85;
}


@end



#pragma mark -

@implementation DKLockedOnPathPointHandle


+ (DKKnobType)			type
{
	return kDKOnPathKnobType | kDKKnobIsDisabledFlag;
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



@end


#pragma mark -


@implementation DKInactiveOnPathPointHandle

+ (DKKnobType)			type
{
	return kDKOnPathKnobType | kDKKnobIsInactiveFlag;
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

@end


#pragma mark -


@implementation DKOffPathPointHandle


+ (DKKnobType)			type
{
	return kDKControlPointKnobType;
}



//+ (NSColor*)			fillColour
+ (DKColor*)			fillColour
{
	//return [NSColor cyanColor];
	return [DKColor cyanColor];
}


@end



#pragma mark -

@implementation DKLockedOffPathPointHandle


+ (DKKnobType)			type
{
	return kDKControlPointKnobType | kDKKnobIsDisabledFlag;
}



//+ (NSColor*)			fillColour
+ (DKColor*)			fillColour
{
	//return [NSColor lightGrayColor];
	return [DKColor lightGrayColor];
}


@end

#pragma mark -


@implementation DKInactiveOffPathPointHandle


+ (DKKnobType)			type
{
	return kDKControlPointKnobType | kDKKnobIsInactiveFlag;
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

@end

