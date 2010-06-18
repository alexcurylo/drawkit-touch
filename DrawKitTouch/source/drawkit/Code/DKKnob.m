//
//  DKKnob.m
///  DrawKit ©2005-2008 Apptree.net
//
//  Created by graham on 21/08/2006.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
//

#import "DKKnob.h"
#import "DKGeometryUtilities.h"
#import "NSBezierPath+Geometry.h"
#if TARGET_OS_IPHONE
#import "DKTDrawingView.h"
#import "UIColor+DKTAdditions.h"
#else
#import "DKDrawingView.h"
#endif TARGET_OS_IPHONE
#import "DKHandle.h"

#define USE_DK_HANDLES			1


NSString*	kDKKnobPreferredHighlightColour = @"kDKKnobPreferredHighlightColour";


//static NSColor*			sKnobColour = nil;
//static NSColor*			sRotationColour = nil;
//static NSColor*			sPointColour = nil;
//static NSColor*			sOffPointColour = nil;
//static NSColor*			sBarColour = nil;
static DKColor*			sKnobColour = nil;
static DKColor*			sRotationColour = nil;
static DKColor*			sPointColour = nil;
static DKColor*			sOffPointColour = nil;
static DKColor*			sBarColour = nil;
static CGFloat			sBarWidth = 0.0;
static NSSize			sKnobSize = { 6.0, 6.0 };


@implementation DKKnob
#pragma mark As a DKKnob


+ (id)				standardKnobs
{
	return [[[DKKnob alloc] init] autorelease];
}



#pragma mark -
#pragma mark - main high-level methods will be called by clients
- (void)			setOwner:(id<DKKnobOwner>) owner
{
	if([owner conformsToProtocol:@protocol(DKKnobOwner)])
		m_ownerRef = owner;
	else
	{
		m_ownerRef = nil;
		NSAssert( NO, @"knobs owner must implement the 'DKKnobOwner' protocol - see DKCommonTypes.h");
	}
}


- (id<DKKnobOwner>)	owner
{
	return m_ownerRef;
}


#pragma mark -
#define FASTER_KNOB_DRAWING		1



- (void)			drawKnobAtPoint:(NSPoint) p ofType:(DKKnobType) knobType userInfo:(id) userInfo
{
	[self drawKnobAtPoint:p ofType:knobType angle:0.0 userInfo:userInfo];
}



//- (void)			drawKnobAtPoint:(NSPoint) p ofType:(DKKnobType) knobType angle:(CGFloat) radians highlightColour:(NSColor*) aColour
- (void)			drawKnobAtPoint:(NSPoint) p ofType:(DKKnobType) knobType angle:(CGFloat) radians highlightColour:(DKColor*) aColour
{
	NSAssert( knobType != 0, @"knob type can't be zero");
	
	// query the owner to find out whether we're active and what the scale is. If there's no owner set, 
	// skip this fancy stuff
	
#if USE_DK_HANDLES
	if([[self owner] respondsToSelector:@selector(knobsWantDrawingActiveState)])
	{
		BOOL active = [[self owner] knobsWantDrawingActiveState];
	
		if ( !active )
			knobType |= kDKKnobIsInactiveFlag;
	}
	
	NSSize ahs = [self actualHandleSize];
	
	if( ahs.width >= 1.0 || ahs.height >= 1.0 )
	{
		DKHandle* handle = [self handleForType:knobType colour:aColour];
		[handle drawAtPoint:p angle:radians];
	}
	return;
#endif

	CGFloat scale = 1.0;
	
	if([self owner] != nil )
	{
		scale = [[self owner] knobsWantDrawingScale];
		
		if ( scale <= 0.0 )
			scale = 1.0;
		
		[self setControlKnobSizeForViewScale:scale];
		
		BOOL active = [[self owner] knobsWantDrawingActiveState];
		
		if ( !active )
			knobType |= kDKKnobIsInactiveFlag;
	}

	// if the knob ends up < 1 pixel across on the screen at this scale, don't draw it
	
	NSSize	cns = [self controlKnobSize];
	CGFloat screenSize = cns.width * scale;
	
	if( screenSize >= 1.0 )
	{
		// as a special case for optimised drawing, the square knob type is drawn by a faster method. Also,
		// control point knobs are drawn this way too, which speeds up that case also.
		
#ifdef FASTER_KNOB_DRAWING
		if(( knobType & kDKKnobTypeMask ) == kDKBoundingRectKnobType || (knobType & kDKKnobTypeMask) == kDKControlPointKnobType )
		{
			NSRect	fkr = [self controlKnobRectAtPoint:p ofType:knobType];
			
			// inset the bounds to allow for half the stroke width to take up that space
			
			CGFloat strokeWidth = [self strokeWidthForKnobType:knobType];
			fkr = NSInsetRect( fkr, cns.width / 16.0f, cns.height / 16.0f );
			
			if( radians != 0.0)
			{
				//NSAffineTransform* transform = RotationTransform( radians, p );
				DKAffineTransform* transform = RotationTransform( radians, p );
				
#if TARGET_OS_IPHONE
            CGContextSaveGState(UIGraphicsGetCurrentContext());
#else
				[NSGraphicsContext saveGraphicsState];
#endif TARGET_OS_IPHONE
				[transform concat];
			}
			
			if( aColour && (knobType & kDKKnobIsDisabledFlag) == 0)
				[aColour set];
			else
				[[self fillColourForKnobType:knobType] set];
			
			DKRectFill( fkr );
			
			if(( knobType & kDKKnobTypeMask ) == kDKBoundingRectKnobType )
			{
				[[self strokeColourForKnobType:knobType] set];
				DKFrameRectWithWidth( fkr, strokeWidth );
				
				if( radians != 0.0 )
#if TARGET_OS_IPHONE
               CGContextRestoreGState(UIGraphicsGetCurrentContext());
#else
               [NSGraphicsContext restoreGraphicsState];
#endif TARGET_OS_IPHONE
			}
		}
		else
#endif
		{
			//NSMutableDictionary* userInfo = [[NSMutableDictionary alloc] init];
			//[userInfo setObject:aColour forKey:kDKKnobPreferredHighlightColour];
			
			//NSBezierPath* path = [self knobPathAtPoint:p ofType:knobType angle:radians userInfo:nil];
			DKBezierPath* path = [self knobPathAtPoint:p ofType:knobType angle:radians userInfo:nil];
			[self drawKnobPath:path ofType:knobType userInfo:nil];
			//[userInfo release];
		}
	}
}



- (void)			drawKnobAtPoint:(NSPoint) p ofType:(DKKnobType) knobType angle:(CGFloat) radians userInfo:(id) userInfo
{
	NSAssert( knobType != 0, @"knob type can't be zero");
	
	// query the owner to find out whether we're active and what the scale is. If there's no owner set, 
	// skip this fancy stuff
	
#if USE_DK_HANDLES
	if([[self owner] respondsToSelector:@selector(knobsWantDrawingActiveState)])
	{
		BOOL active = [[self owner] knobsWantDrawingActiveState];
		
		if ( !active )
			knobType |= kDKKnobIsInactiveFlag;
	}

	NSSize ahs = [self actualHandleSize];
	
	if( ahs.width >= 1.0 || ahs.height >= 1.0 )
	{
		DKHandle* handle = [self handleForType:knobType];
		[handle drawAtPoint:p angle:radians];
	}
	return;
#endif	

	CGFloat scale = 1.0;
	
	if([self owner] != nil )
	{
		scale = [[self owner] knobsWantDrawingScale];
		
		if ( scale <= 0.0 )
			scale = 1.0;
			
		[self setControlKnobSizeForViewScale:scale];
		
		BOOL active = [[self owner] knobsWantDrawingActiveState];
		
		if ( !active )
			knobType |= kDKKnobIsInactiveFlag;
	}
	
	// if the knob ends up < 1 pixel across on the screen at this scale, don't draw it
	
	NSSize	cns = [self controlKnobSize];
	CGFloat screenSize = cns.width * scale;
	
	if( screenSize >= 1.0 )
	{
		// as a special case for optimised drawing, the square knob type is drawn by a faster method. Also,
		// control point knobs are drawn this way too, which speeds up that case also.

#ifdef FASTER_KNOB_DRAWING
		if(( knobType & kDKKnobTypeMask ) == kDKBoundingRectKnobType || (knobType & kDKKnobTypeMask) == kDKControlPointKnobType )
		{
			NSRect	fkr = [self controlKnobRectAtPoint:p ofType:knobType];
			
			// inset the bounds to allow for half the stroke width to take up that space
			
			CGFloat strokeWidth = [self strokeWidthForKnobType:knobType];
			fkr = NSInsetRect( fkr, cns.width / 16.0f, cns.height / 16.0f );
			
			if( radians != 0.0)
			{
				//NSAffineTransform* transform = RotationTransform( radians, p );
				DKAffineTransform* transform = RotationTransform( radians, p );
			
#if TARGET_OS_IPHONE
            CGContextSaveGState(UIGraphicsGetCurrentContext());
#else
				[NSGraphicsContext saveGraphicsState];
#endif TARGET_OS_IPHONE
				[transform concat];
			}
			
			[[self fillColourForKnobType:knobType] set];
			DKRectFill( fkr );
			
			if(( knobType & kDKKnobTypeMask ) == kDKBoundingRectKnobType )
			{
				[[self strokeColourForKnobType:knobType] set];
				DKFrameRectWithWidth( fkr, strokeWidth );
				
				if( radians != 0.0 )
#if TARGET_OS_IPHONE
               CGContextRestoreGState(UIGraphicsGetCurrentContext());
#else
               [NSGraphicsContext restoreGraphicsState];
#endif TARGET_OS_IPHONE
			}
		}
		else
#endif
		{
			//NSBezierPath* path = [self knobPathAtPoint:p ofType:knobType angle:radians userInfo:userInfo];
			DKBezierPath* path = [self knobPathAtPoint:p ofType:knobType angle:radians userInfo:userInfo];
			[self drawKnobPath:path ofType:knobType userInfo:userInfo];
		}
	}
}


- (void)			drawControlBarFromPoint:(NSPoint) a toPoint:(NSPoint) b
{
	BOOL active = YES;
	
	if([self owner])
		active = [[self owner] knobsWantDrawingActiveState];
	
	if( active )
		[[self controlBarColour] set];
	else
		//[[NSColor lightGrayColor] set];
		[[DKColor lightGrayColor] set];
	
#if TARGET_OS_IPHONE
   [DKBezierPath setDefaultLineWidth:[[self class] controlBarWidth]];
#else
	// normally knobs would never be drawn to a print of PDF context, but there is a special hidden feature that
	// creates PDFs with the knobs drawn, so make sure that the control bar does come up visible.
	
	if([NSGraphicsContext currentContextDrawingToScreen])
		//[NSBezierPath setDefaultLineWidth:[[self class] controlBarWidth]];
		[DKBezierPath setDefaultLineWidth:[[self class] controlBarWidth]];
	else
		//[NSBezierPath setDefaultLineWidth:1.0];
		[DKBezierPath setDefaultLineWidth:1.0];
#endif TARGET_OS_IPHONE
	//[NSBezierPath strokeLineFromPoint:a toPoint:b];
	[DKBezierPath strokeLineFromPoint:a toPoint:b];
}


- (void)			drawControlBarWithKnobsFromPoint:(NSPoint) a toPoint:(NSPoint) b
{
	[self drawControlBarWithKnobsFromPoint:a ofType:kDKControlPointKnobType toPoint:b ofType:kDKControlPointKnobType];
}


- (void)			drawControlBarWithKnobsFromPoint:(NSPoint) a ofType:(DKKnobType) typeA toPoint:(NSPoint) b ofType:(DKKnobType) typeB
{
	CGFloat angle = atan2f( b.y - a.y, b.x - a.x );
	
	[self drawControlBarFromPoint:a toPoint:b];
	[self drawKnobAtPoint:a ofType:typeA angle:angle userInfo:nil];
	[self drawKnobAtPoint:b ofType:typeB angle:angle userInfo:nil];
}


- (void)			drawRotationBarWithKnobsFromCentre:(NSPoint) centre toPoint:(NSPoint) p
{
	// draws a rotation bar which is a special form of control bar used to signal that a rotation operation is
	// occurring. A target is drawn at <centre> and a rotation knob at <p>
	
	[self drawControlBarWithKnobsFromPoint:centre ofType:kDKCentreTargetKnobType toPoint:p ofType:kDKRotationKnobType];
}


- (void)			drawPartcode:(NSInteger) code atPoint:(NSPoint) p fontSize:(CGFloat) fontSize
{
	// this is generally only used for debugging. It draws the number <code> inside a box at the location given, using the fontSize.
	
	static NSMutableDictionary*	attrs = nil;
	
	if ( attrs == nil )
		attrs = [[NSMutableDictionary alloc] init];
		
	// calculate the actual drawn font size based on the control size - this avoids huge numbers being drawn when the view
	// is zoomed in
	
#if TARGET_OS_IPHONE
   (void)code;
   (void)fontSize;
   (void)p;
   twlog("implement drawPartcode");
#else
	CGFloat scale = [[self owner] knobsWantDrawingScale];	
	
	if ( scale == 0.0 )
		scale = 1.0;
		
	fontSize /= scale;
	
	if ( fontSize < 2.0 )
		fontSize = 2.0;
		
	//NSFont*		font = [NSFont fontWithName:@"Monaco" size:fontSize];
	DKFont*		font = [DKFont fontWithName:@"Monaco" size:fontSize];
	[attrs setObject:font forKey:NSFontAttributeName];

	NSString*	s = [NSString stringWithFormat:@"%ld", (long)code];
	NSRect box;
	
	box.size = [s sizeWithAttributes:attrs];
	box.origin = p;

	NSRect b = ScaleRect( box, 1.5 ); //NSInsetRect( box, -1.5, -1 );
	//[[NSColor whiteColor] set];
	[[DKColor whiteColor] set];
	DKRectFill( b );
	//[[NSColor blackColor] set];
	[[DKColor blackColor] set];
	[s drawInRect:box withAttributes:attrs];
	//DKFrameRectWithWidth( b, 0.0 );
	//[NSBezierPath setDefaultLineWidth:0.0];
	//[NSBezierPath strokeRect:b];
	[DKBezierPath setDefaultLineWidth:0.0];
	[DKBezierPath strokeRect:b];
#endif TARGET_OS_IPHONE
}


#pragma mark -


- (BOOL)			hitTestPoint:(NSPoint) p inKnobAtPoint:(NSPoint) kp ofType:(DKKnobType) knobType userInfo:(id) userInfo
{
	NSRect br = [self controlKnobRectAtPoint:kp ofType:knobType];
	
	if ( NSPointInRect( p, br ))
	{
		//NSBezierPath* path = [self knobPathAtPoint:kp ofType:knobType angle:0.0 userInfo:userInfo];
		DKBezierPath* path = [self knobPathAtPoint:kp ofType:knobType angle:0.0 userInfo:userInfo];
		return [path containsPoint:p];
	}
	else
		return NO;
}




//- (void)			setControlBarColour:(NSColor*) clr
- (void)			setControlBarColour:(DKColor*) clr
{
	[clr retain];
	[mControlBarColour release];
	mControlBarColour = clr;
}


//- (NSColor*)		controlBarColour
- (DKColor*)		controlBarColour
{
	return mControlBarColour;
}



- (void)			setControlBarWidth:(CGFloat) width
{
	mControlBarWidth = width;
}


- (CGFloat)			controlBarWidth
{
	return mControlBarWidth;
}


- (void)			setScalingRatio:(CGFloat) scaleRatio
{
	mScaleRatio = scaleRatio;
}


- (CGFloat)			scalingRatio
{
	return mScaleRatio;
}

#pragma mark -
#pragma mark - low-level methods (mostly internal and overridable)
- (void)			setControlKnobSize:(NSSize) cks
{
	m_knobSize = cks;
}


- (void)			setControlKnobSizeForViewScale:(CGFloat) scale
{
	// given a scale of a view where 1.0 = 100%, this calculates the appropriate control knob size to use. Note that control knobs are not
	// set to a fixed size, but do scale a little. This gives a better feel when zooming the view than a straight compensation.
	
	NSAssert( scale > 0.0, @"scale is 0!" );
	
	CGFloat   ff = (( scale - 1.0 ) * mScaleRatio ) + 1.0;
	
	NSSize ns = [[self class] controlKnobSize];
	
	ns.width /= ff;
	ns.height /= ff;
	[self setControlKnobSize:ns];
}


- (NSSize)			controlKnobSize
{
	return m_knobSize;
}


#pragma mark -

- (DKHandle*)		handleForType:(DKKnobType) knobType
{
	return [self handleForType:knobType colour:nil];
}


//- (DKHandle*)		handleForType:(DKKnobType) knobType colour:(NSColor*) colour
- (DKHandle*)		handleForType:(DKKnobType) knobType colour:(DKColor*) colour
{
	return [DKHandle handleForType:knobType size:[self actualHandleSize] colour:colour];
}


- (NSSize)			actualHandleSize
{
	// the size of the handle as it is actually drawn to hte screen, taking into account all the scale factors, etc.
	
	CGFloat scale = 1.0;
	
	if([self owner] != nil )
	{
		scale = [[self owner] knobsWantDrawingScale];
		
		if ( scale <= 0.0 )
			scale = 1.0;
		
		[self setControlKnobSizeForViewScale:scale];
	}
	
	NSSize cns = [self controlKnobSize];
	
	cns.width *= scale;
	cns.height *= scale;
	
	return cns;
}


#pragma mark -
#pragma mark As an NSObject
- (id)				init
{
	self = [super init];
	if (self != nil)
	{
		NSAssert(m_ownerRef == nil, @"Expected init to zero");
		[self setControlKnobSize:[[self class] controlKnobSize]];
		mScaleRatio = 0.3;
		
		// all initial colours are set from class settings
		
		[self setControlKnobColour:[[self class] controlKnobColour]];
		[self setRotationKnobColour:[[self class] rotationKnobColour]];
		[self setControlOnPathPointColour:[[self class] controlOnPathPointColour]];
		[self setControlOffPathPointColour:[[self class] controlOffPathPointColour]];
		[self setControlBarColour:[[self class] controlBarColour]];
		[self setControlBarWidth:[[self class] controlBarWidth]];
	}
	
	return self;
}


- (void)			dealloc
{
	[mControlKnobColour release];
	[mRotationKnobColour release];
	[mControlOnPathPointColour release];
	[mControlOffPathPointColour release];
	[mControlBarColour release];
	[super dealloc];
}


- (id)				initWithCoder:(NSCoder*) coder
{
	[self setOwner:[coder decodeObjectForKey:@"DKKnob_ownerRef"]];
	mScaleRatio = [coder decodeDoubleForKey:@"DKKnob_scaleRatio"];
	[self setControlKnobSize:[coder decodeSizeForKey:@"DKKnob_controlKnobSize"]];
	
	[self setControlKnobColour:[coder decodeObjectForKey:@"DKKnob_knobColour"]];
	[self setRotationKnobColour:[coder decodeObjectForKey:@"DKKnob_rotationKnobColour"]];
	[self setControlOnPathPointColour:[coder decodeObjectForKey:@"DKKnob_onPathPointColour"]];
	[self setControlOffPathPointColour:[coder decodeObjectForKey:@"DKKnob_offPathPointColour"]];
	[self setControlBarColour:[coder decodeObjectForKey:@"DKKnob_controlBarColour"]];
	[self setControlBarWidth:[coder decodeDoubleForKey:@"DKKnob_controlBarWidth"]];
	
	return self;
}


- (void)			encodeWithCoder:(NSCoder*) coder
{
	[coder encodeConditionalObject:[self owner] forKey:@"DKKnob_ownerRef"];
	[coder encodeDouble:mScaleRatio forKey:@"DKKnob_scaleRatio"];
	[coder encodeSize:[self controlKnobSize] forKey:@"DKKnob_controlKnobSize"];

	[coder encodeObject:[self controlKnobColour] forKey:@"DKKnob_knobColour"];
	[coder encodeObject:[self rotationKnobColour] forKey:@"DKKnob_rotationKnobColour"];
	[coder encodeObject:[self controlOnPathPointColour] forKey:@"DKKnob_onPathPointColour"];
	[coder encodeObject:[self controlOffPathPointColour] forKey:@"DKKnob_offPathPointColour"];
	[coder encodeObject:[self controlBarColour] forKey:@"DKKnob_controlBarColour"];

	[coder encodeDouble:[self controlBarWidth] forKey:@"DKKnob_controlBarWidth"];
}


- (id)				copyWithZone:(NSZone*) aZone
{
	DKKnob* copy = [[[self class] allocWithZone:aZone] init];
	
	[copy setControlKnobColour:[self controlKnobColour]];
	[copy setRotationKnobColour:[self rotationKnobColour]];
	[copy setControlOnPathPointColour:[self controlOnPathPointColour]];
	[copy setControlOffPathPointColour:[self controlOffPathPointColour]];
	[copy setControlBarColour:[self controlBarColour]];
	[copy setControlBarWidth:[self controlBarWidth]];
	[copy setScalingRatio:[self scalingRatio]];
	[copy setControlKnobSize:[self controlKnobSize]];
	
	return copy;
}


@end


#pragma mark -

@implementation DKKnob (Deprecated)

//+ (void)			setControlKnobColour:(NSColor*) clr
+ (void)			setControlKnobColour:(DKColor*) clr
{
	[clr retain];
	[sKnobColour release];
	sKnobColour = clr;
}


//+ (NSColor*)		controlKnobColour
+ (DKColor*)		controlKnobColour
{
	if ( sKnobColour == nil )
		//[DKKnob setControlKnobColour:[NSColor colorWithDeviceRed:0.5 green:0.9 blue:1.0 alpha:1.0]];
		[DKKnob setControlKnobColour:[DKColor colorWithDeviceRed:0.5 green:0.9 blue:1.0 alpha:1.0]];
	
	return sKnobColour;
}


//+ (void)			setRotationKnobColour:(NSColor*) clr
+ (void)			setRotationKnobColour:(DKColor*) clr
{
	[clr retain];
	[sRotationColour release];
	sRotationColour = clr;
}

//+ (NSColor*)		rotationKnobColour
+ (DKColor*)		rotationKnobColour
{
	if ( sRotationColour == nil )
		//[DKKnob setRotationKnobColour:[NSColor purpleColor]];
		[DKKnob setRotationKnobColour:[DKColor purpleColor]];
	
	return sRotationColour;
}


//+ (void)			setControlOnPathPointColour:(NSColor*) clr
+ (void)			setControlOnPathPointColour:(DKColor*) clr
{
	[clr retain];
	[sPointColour release];
	sPointColour = clr;
}


//+ (NSColor*)		controlOnPathPointColour
+ (DKColor*)		controlOnPathPointColour
{
	if ( sPointColour == nil )
		//[DKKnob setControlOnPathPointColour:[NSColor orangeColor]];
		[DKKnob setControlOnPathPointColour:[DKColor orangeColor]];
	
	return sPointColour;
}


//+ (void)			setControlOffPathPointColour:(NSColor*) clr
+ (void)			setControlOffPathPointColour:(DKColor*) clr
{
	[clr retain];
	[sOffPointColour release];
	sOffPointColour = clr;
}


//+ (NSColor*)		controlOffPathPointColour
+ (DKColor*)		controlOffPathPointColour
{
	if ( sOffPointColour == nil )
		//[DKKnob setControlOffPathPointColour:[NSColor cyanColor]];
		[DKKnob setControlOffPathPointColour:[DKColor cyanColor]];
	
	return sOffPointColour;
}

//+ (void)			setControlBarColour:(NSColor*) clr
+ (void)			setControlBarColour:(DKColor*) clr
{
	[clr retain];
	[sBarColour release];
	sBarColour = clr;
}


//+ (NSColor*)		controlBarColour
+ (DKColor*)		controlBarColour
{
	if ( sBarColour == nil )
		//[DKKnob setControlBarColour:[NSColor cyanColor]];
		[DKKnob setControlBarColour:[DKColor cyanColor]];
	
	return sBarColour;
}


+ (void)			setControlKnobSize:(NSSize) size
{
	sKnobSize = size;
	
}


+ (NSSize)			controlKnobSize
{
	return sKnobSize;
}


+ (void)			setControlBarWidth:(CGFloat) width
{
	sBarWidth = width;
}


+ (CGFloat)			controlBarWidth
{
	return sBarWidth;
}


+ (NSRect)			controlKnobRectAtPoint:(NSPoint) kp
{
	NSRect r;
	
	r.size = [[self class] controlKnobSize];
	r.origin.x = kp.x - ( r.size.width * 0.5f );
	r.origin.y = kp.y - ( r.size.height * 0.5f );
	
	return r;
}

#pragma mark -

//- (NSColor*)		fillColourForKnobType:(DKKnobType) knobType
- (DKColor*)		fillColourForKnobType:(DKKnobType) knobType
{
	BOOL locked = ((knobType & kDKKnobIsDisabledFlag) != 0);
	BOOL inactive = ((knobType & kDKKnobIsInactiveFlag) != 0);
	
	//NSColor* result = nil;
	DKColor* result = nil;
	
	if ( inactive )
		//result = [NSColor lightGrayColor];
		result = [DKColor lightGrayColor];
	else
	{
		if ( locked )
			//result = [NSColor whiteColor];
			result = [DKColor whiteColor];
		else
		{
			switch( knobType & kDKKnobTypeMask )
			{
				case kDKControlPointKnobType:
				case kDKBoundingRectKnobType:
					result = [self controlKnobColour];
					break;
					
				case kDKOnPathKnobType:
					result = [self controlOnPathPointColour];
					break;
					
				case kDKRotationKnobType:
					result = [self rotationKnobColour];
					break;
					
				case kDKHotspotKnobType:
					//result = [NSColor yellowColor];
					result = [DKColor yellowColor];
					break;
					
				case kDKCentreTargetKnobType:
				default:
					break;
			}
		}
	}
	return result;
}


//- (NSColor*)		strokeColourForKnobType:(DKKnobType) knobType
- (DKColor*)		strokeColourForKnobType:(DKKnobType) knobType
{
	BOOL locked = ((knobType & kDKKnobIsDisabledFlag) != 0);
	BOOL inactive = ((knobType & kDKKnobIsInactiveFlag) != 0);
	
	//NSColor* result = nil;
	DKColor* result = nil;
	
	if ( locked || inactive )
		//result = [NSColor grayColor];
		result = [DKColor grayColor];
	else
	{
		switch( knobType & kDKKnobTypeMask )
		{
			case kDKBoundingRectKnobType:
				//result = [NSColor darkGrayColor];
				result = [DKColor darkGrayColor];
				break;
				
			case kDKRotationKnobType:
				//result = [NSColor whiteColor];
				result = [DKColor whiteColor];
				break;
				
			case kDKCentreTargetKnobType:
				result = [self controlKnobColour];
				break;
				
			case kDKHotspotKnobType:
				//result = [NSColor blackColor];
				result = [DKColor blackColor];
				break;
				
			case kDKOnPathKnobType:
			default:
				break;
		}
	}
	
	return result;
}


- (CGFloat)			strokeWidthForKnobType:(DKKnobType) knobType
{
	NSSize cns = [self controlKnobSize];
	CGFloat	strk = 0.0;
	
	switch( knobType & kDKKnobTypeMask )
	{
		case kDKCentreTargetKnobType:
			strk = cns.width * 4.0f / 24.0f;
			break;
			
		case kDKRotationKnobType:
			strk = cns.width / 6.0;
			break;
			
		default:
			strk = cns.width / 8.0f;
			break;
	}
	
	return strk;
}



//- (void)			setControlKnobColour:(NSColor*) clr
- (void)			setControlKnobColour:(DKColor*) clr
{
	[clr retain];
	[mControlKnobColour release];
	mControlKnobColour = clr;
}



//- (NSColor*)		controlKnobColour
- (DKColor*)		controlKnobColour
{
	return mControlKnobColour;
}



//- (void)			setRotationKnobColour:(NSColor*) clr
- (void)			setRotationKnobColour:(DKColor*) clr
{
	[clr retain];
	[mRotationKnobColour release];
	mRotationKnobColour = clr;
}



//- (NSColor*)		rotationKnobColour
- (DKColor*)		rotationKnobColour
{
	return mRotationKnobColour;
}



//- (void)			setControlOnPathPointColour:(NSColor*) clr
- (void)			setControlOnPathPointColour:(DKColor*) clr
{
	[clr retain];
	[mControlOnPathPointColour release];
	mControlOnPathPointColour = clr;
}



//- (NSColor*)		controlOnPathPointColour
- (DKColor*)		controlOnPathPointColour
{
	return mControlOnPathPointColour;
}



//- (void)			setControlOffPathPointColour:(NSColor*) clr
- (void)			setControlOffPathPointColour:(DKColor*) clr
{
	[clr retain];
	[mControlOffPathPointColour release];
	mControlOffPathPointColour = clr;
}



//- (NSColor*)		controlOffPathPointColour
- (DKColor*)		controlOffPathPointColour
{
	return mControlOffPathPointColour;
}

#pragma mark -
//- (NSBezierPath*)	knobPathAtPoint:(NSPoint) p ofType:(DKKnobType) knobType angle:(CGFloat) radians userInfo:(id) userInfo
- (DKBezierPath*)	knobPathAtPoint:(NSPoint) p ofType:(DKKnobType) knobType angle:(CGFloat) radians userInfo:(id) userInfo
{
#pragma unused(userInfo)
	
	knobType &= kDKKnobTypeMask;	// mask off flags - of no interest here
	
	BOOL			isRect = ( knobType == kDKBoundingRectKnobType ||
							  knobType == kDKHotspotKnobType ||
							  knobType == kDKMoreTextIndicatorKnobType );
	//NSBezierPath*	path;
	DKBezierPath*	path;
	NSRect			boundsRect = [self controlKnobRectAtPoint:p ofType:knobType];
	
	// inset the bounds to allow for half the stroke width to take up that space
	
	CGFloat strokeWidth = [self strokeWidthForKnobType:knobType];
	boundsRect = NSInsetRect( boundsRect, strokeWidth * 0.5f, strokeWidth * 0.5f );
	
	if ( isRect )
	{
		//path = [NSBezierPath bezierPathWithRect:boundsRect];
		path = [DKBezierPath bezierPathWithRect:boundsRect];
		
		// if angle non-zero, apply rotation to the path about the point p
		
		if ( radians != 0.0 )
			path = [path rotatedPath:radians aboutPoint:p];
	}
	else if ( knobType == kDKCentreTargetKnobType )
	{
		//path = [NSBezierPath bezierPath];
		path = [DKBezierPath bezierPath];
		NSSize		half;
		
		half.width = boundsRect.size.width * 0.5f;
		half.height = boundsRect.size.height * 0.5f;
		
		p.y -= half.height;
		[path moveToPoint:p];
		p.y += boundsRect.size.height;
		[path lineToPoint:p];
		
		p.y -= half.height;
		p.x -= half.width;
		[path moveToPoint:p];
		p.x += boundsRect.size.width;
		[path lineToPoint:p];
		
		NSRect	tr = ScaleRect( boundsRect, 0.5 );
		[path appendBezierPathWithOvalInRect:tr];
	}
	else
	    //path = [NSBezierPath bezierPathWithOvalInRect:boundsRect];
	    path = [DKBezierPath bezierPathWithOvalInRect:boundsRect];
	
	return path;
}


//- (void)			drawKnobPath:(NSBezierPath*) path ofType:(DKKnobType) knobType userInfo:(id) userInfo
- (void)			drawKnobPath:(DKBezierPath*) path ofType:(DKKnobType) knobType userInfo:(id) userInfo
{
#pragma unused(userInfo)
	NSAssert( path != nil, @"can't draw knob path - nil");
	
	DKKnobDrawingFlags	flags = [self drawingFlagsForKnobType:knobType];
	//NSColor*			colour;
	DKColor*			colour;
	
	// fill first, stroke on top if requested
	
	if( flags & kDKKnobDrawsFill )
	{
		// if <userInfo> is a dictionary and it contains the kDKKnobPreferredHighlightColour key, use that colour here
		
		colour = [self fillColourForKnobType:knobType];
		
		if( userInfo != nil && [userInfo isKindOfClass:[NSDictionary class]])
		{
			//NSColor* preferred = [(NSDictionary*)userInfo objectForKey:kDKKnobPreferredHighlightColour];
			DKColor* preferred = [(NSDictionary*)userInfo objectForKey:kDKKnobPreferredHighlightColour];
			
			if( preferred != nil )
				colour = preferred;
		}
		
		[colour setFill];
		[path fill];
	}
	
	if( flags & kDKKnobDrawsStroke )
	{
		colour = [self strokeColourForKnobType:knobType];
		[colour setStroke];
		[path setLineWidth:[self strokeWidthForKnobType:knobType]];
		[path stroke];
	}
}


- (DKKnobDrawingFlags) drawingFlagsForKnobType:(DKKnobType) knobType
{
	BOOL locked = ((knobType & kDKKnobIsDisabledFlag) != 0);
	DKKnobDrawingFlags result = kDKKnobDrawsFill;
	
	switch( knobType & kDKKnobTypeMask )
	{
		case kDKControlPointKnobType:
		case kDKOnPathKnobType:
			break;
			
		case kDKHotspotKnobType:	
		case kDKBoundingRectKnobType:
		case kDKRotationKnobType:
			result |= kDKKnobDrawsStroke;
			break;
			
		case kDKCentreTargetKnobType:
			result |= kDKKnobDrawsStroke;
			result &= ~kDKKnobDrawsFill;
			break;
			
		default:
			break;
	}
	
	if( locked )
		result |= kDKKnobDrawsStroke;
	
	return result;
}

- (NSRect)			controlKnobRectAtPoint:(NSPoint) kp
{
	NSSize hs = [self controlKnobSize];
	NSRect hr = NSMakeRect( kp.x, kp.y, hs.width, hs.height );
	
	hr = NSOffsetRect( hr, -( hs.width * 0.5f ), -( hs.height * 0.5f ));
	
	return hr;
}


- (NSRect)			controlKnobRectAtPoint:(NSPoint) kp ofType:(DKKnobType) knobType
{
	NSRect	kr = [self controlKnobRectAtPoint:kp];
	
	switch( knobType & kDKKnobTypeMask )
	{
		case kDKCentreTargetKnobType:
			kr = ScaleRect( kr, 2.5 );
			break;
			
		case kDKRotationKnobType:
			kr = ScaleRect( kr, 1.3 );
			break;
			
		case kDKHotspotKnobType:
			kr = ScaleRect( kr, 1.25 );
			break;
			
		case kDKControlPointKnobType:
			kr = ScaleRect( kr, 0.85 );
			break;
			
		default:
			break;
	}
	
	return kr;
}


@end

