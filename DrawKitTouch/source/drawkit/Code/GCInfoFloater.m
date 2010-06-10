//
//  GCInfoFloater.m
///  DrawKit �2005-2008 Apptree.net
//
//  Created by graham on 02/10/2006.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
//

#import "GCInfoFloater.h"
#import "GCOneShotEffectTimer.h"
#if TARGET_OS_IPHONE
#import "UIColor+DKTAdditions.h"
#else
#import "NSColor+DKAdditions.h"
#endif TARGET_OS_IPHONE

@implementation GCInfoFloater
#pragma mark As a GCInfoFloater
+ (GCInfoFloater*)	infoFloater
{
#if TARGET_OS_IPHONE
   GCInfoFloater* fi = [[[GCInfoFloater alloc] initWithFrame:NSZeroRect] autorelease];
#else
	GCInfoFloater* fi = [[[GCInfoFloater alloc]  initWithContentRect:NSZeroRect
												styleMask:NSBorderlessWindowMask
												backing:NSBackingStoreBuffered
												defer:YES] autorelease];
	
	// note - because windows are all sent a -close message at quit time, set it
	// not to be released at that time, otherwise the release from the autorelease pool
	// will cause a crash due to the stale reference

	[fi setReleasedWhenClosed:NO];	// **** important!! ****
#endif TARGET_OS_IPHONE
	
	return fi;
}


#pragma mark -
#if TARGET_OS_IPHONE
- (id)initWithFrame:(CGRect)contentRect
#else
- (id)	initWithContentRect:(NSRect) contentRect
		styleMask:(NSUInteger) styleMask
		backing:(NSBackingStoreType) bufferingType
		defer:(BOOL) deferCreation
#endif TARGET_OS_IPHONE
{
#if TARGET_OS_IPHONE
   self = [super initWithFrame:contentRect];
#else
	self = [super initWithContentRect:contentRect
			styleMask:styleMask
			backing:bufferingType
			defer:deferCreation];
#endif TARGET_OS_IPHONE
	if (self != nil)
	{
		// add a control view that displays the actual info value
		
#if TARGET_OS_IPHONE
		UILabel* di = [[[UILabel alloc] initWithFrame:contentRect] autorelease];
		
		if (di != nil)
		{
			[di setFont:[UIFont fontWithName:@"Helvetica" size:10]];
			
			m_infoViewRef = di;
			[self addSubview:di];
		}
#else
		NSTextField* di = [[[NSTextField alloc] initWithFrame:contentRect] autorelease];
		
		if (di != nil)
		{
			//[di setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
			[di setBezeled:NO];
			[di setDrawsBackground:NO];
			[di setEditable:NO];
			[di setSelectable:NO];
			[di setFont:[NSFont fontWithName:@"Helvetica" size:10]];
			
			m_infoViewRef = di;
			[[self contentView] addSubview:di];
		}
#endif TARGET_OS_IPHONE
		
		// add a formatter that will give us the value display we need. The default formatter is useful for
		// typical numeric float values but the particular user of the class may prefer to set a different formatter
		// which can be simply done using setFormat:
		
		[self setFormat:@",0.000"];
		
		if (m_infoViewRef == nil)
		{
			[self autorelease];
			self = nil;
		}
	}
	if (self != nil)
	{
		//[self setBackgroundColor:[NSColor colorWithDeviceRed:1.0 green:1.0 blue:0.6 alpha:1.0]];
		[self setBackgroundColor:[DKColor colorWithDeviceRed:1.0 green:1.0 blue:0.6 alpha:1.0]];
#ifndef TARGET_OS_IPHONE
		[self setLevel:NSFloatingWindowLevel];
		[self setHasShadow:YES];
		[self setOpaque:YES];
		[self setReleasedWhenClosed:YES];
#endif TARGET_OS_IPHONE
		[self setWindowOffset:NSMakeSize( 1.0, 4.0 )];
		[self setDoubleValue:0.0];
	}
	
	return self;
}

#if TARGET_OS_IPHONE
- (void)dealloc
{
   [m_formatter release];
   m_formatter = nil;
   
   [super dealloc];
}
#endif TARGET_OS_IPHONE


#pragma mark -
- (void)			setFloatValue:(float) val
{
	[self setDoubleValue:(double) val];
}


- (void)			setDoubleValue:(double) val
{
	//NSColor* textColor = [[self backgroundColor] contrastingColor];
	DKColor* textColor = [[self backgroundColor] contrastingColor];
#if TARGET_OS_IPHONE
	[m_infoViewRef setTextColor:textColor];
	
   if (m_formatter)
      m_infoViewRef.text = [m_formatter stringFromNumber:[NSNumber numberWithDouble:val]];
   else
      m_infoViewRef.text = [NSString stringWithFormat:@"%.02f", val];
#else
	[(NSTextField*)m_infoViewRef setTextColor:textColor];

	[m_infoViewRef setDoubleValue:val];
#endif TARGET_OS_IPHONE
	[m_infoViewRef sizeToFit];
	
	NSRect fr = [m_infoViewRef frame];
	fr.origin = [self frame].origin;
	
#if TARGET_OS_IPHONE
   self.frame = fr;
#else
	[self setFrame:fr display:YES];
#endif TARGET_OS_IPHONE
}


- (void)			setStringValue:(NSString*) str
{
	//NSColor* textColor = [[self backgroundColor] contrastingColor];
	DKColor* textColor = [[self backgroundColor] contrastingColor];
#if TARGET_OS_IPHONE
	[m_infoViewRef setTextColor:textColor];
   
   m_infoViewRef.text = str;
#else
	[(NSTextField*)m_infoViewRef setTextColor:textColor];
   
	[m_infoViewRef setStringValue:str];
#endif TARGET_OS_IPHONE
	[m_infoViewRef sizeToFit];
	
	NSRect fr = [m_infoViewRef frame];
	fr.origin = [self frame].origin;
	
#if TARGET_OS_IPHONE
   self.frame = fr;
#else
	[self setFrame:fr display:YES];
#endif TARGET_OS_IPHONE
}


#pragma mark -
- (void)			setFormat:(NSString*) fmt
{
	// sets the format of the formatter to <fmt>. If <fmt> is nil, removes the formatter.
	
#if TARGET_OS_IPHONE
   [m_formatter release];
   m_formatter = nil;
   if (fmt)
   {
      m_formatter = [[NSNumberFormatter alloc] init];
      NSArray *formats = [fmt componentsSeparatedByString:@";"];
      if (formats.count)
         [m_formatter setPositiveFormat:[formats objectAtIndex:0]];
      if (1 < formats.count)
         [m_formatter setNegativeFormat:[formats lastObject]];
   }
#else
	if( fmt == nil )
		[m_infoViewRef setFormatter:nil];
	else
	{
		if([m_infoViewRef formatter] == nil)
		{
			NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];		
			[m_infoViewRef setFormatter:formatter];
			[formatter release];
		}
			
		[[m_infoViewRef formatter] setFormat:fmt];
	}
#endif TARGET_OS_IPHONE
}


- (void)			setWindowOffset:(NSSize) offset;
{
	m_wOffset = offset;
}


//- (void)			positionNearPoint:(NSPoint) p inView:(NSView*) v
- (void)			positionNearPoint:(NSPoint) p inView:(DKDrawingView *) v
{
	// places the window just to the right and above the point p as expressed in the coordinate system of view v.
	
	p = [v convertPoint:p toView:nil];
	
#if TARGET_OS_IPHONE
	CGPoint gp = [v convertPoint:p toView:[v window]];
#else
	NSPoint gp = [[v window] convertBaseToScreen:p];
#endif TARGET_OS_IPHONE
   
	gp.x += m_wOffset.width;
	gp.y += m_wOffset.height;
	[self positionAtScreenPoint:gp];
}



- (void)			positionAtScreenPoint:(NSPoint) sp
{
#if TARGET_OS_IPHONE
	CGRect newFrame = { .origin = sp, .size = self.frame.size };
   self.frame = newFrame;
#else
	[self setFrameOrigin:sp];
#endif TARGET_OS_IPHONE
}

#pragma mark -
- (void)			show
{
#if TARGET_OS_IPHONE
	self.alpha = 0.95;
   self.hidden = NO;
   [self.superview bringSubviewToFront:self];
#else
	[self setAlphaValue:0.95];
	[self orderFront:self];
#endif TARGET_OS_IPHONE
}


- (void)			hide
{
#if TARGET_OS_IPHONE
	if(self.superview && !self.hidden)
#else
	if([self isVisible])
#endif TARGET_OS_IPHONE
		[GCOneShotEffectTimer oneShotWithStandardFadeTimeForDelegate:self];
}


#pragma mark -
#pragma mark - As a NSWindow

//- (void)			setBackgroundColor:(NSColor*) colour
- (void)			setBackgroundColor:(DKColor*) colour
{
	// needs to be an RGB colour as floater uses -contrastingColor method that assumes this
	
#if TARGET_OS_IPHONE
	colour = [colour colorUsingCalibratedRGBColorSpace];
#else
	colour = [colour colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
#endif TARGET_OS_IPHONE
	[super setBackgroundColor:colour];
}


#pragma mark -
#pragma mark - As a GCOneShotEffect delegate
- (void)			oneShotHasReached:(CGFloat) relpos
{
#if TARGET_OS_IPHONE
	self.alpha = 1.0 - relpos;
#else
	[self setAlphaValue:1.0 - relpos];
#endif TARGET_OS_IPHONE
}


- (void)			oneShotComplete
{
#if TARGET_OS_IPHONE
	[self release];
#else
	[self orderOut:self];
#endif TARGET_OS_IPHONE
}



@end
