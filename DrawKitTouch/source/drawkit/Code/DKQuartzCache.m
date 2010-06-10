//
//  DKQuartzCache.m
//  GCDrawKit
//
//  Created by graham on 4/09/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

#import "DKQuartzCache.h"


@implementation DKQuartzCache


+ (DKQuartzCache*)	cacheForCurrentContextWithSize:(NSSize) size
{
#if TARGET_OS_IPHONE
	DKQuartzCache* cache = [[self alloc] initWithContext:UIGraphicsGetCurrentContext() forRect:NSMakeRect( 0, 0, size.width, size.height )];
#else
	DKQuartzCache* cache = [[self alloc] initWithContext:[NSGraphicsContext currentContext] forRect:NSMakeRect( 0, 0, size.width, size.height )];
#endif TARGET_OS_IPHONE
	return [cache autorelease];
}


+ (DKQuartzCache*)	cacheForCurrentContextInRect:(NSRect) rect
{
#if TARGET_OS_IPHONE
	DKQuartzCache* cache = [[self alloc] initWithContext:UIGraphicsGetCurrentContext() forRect:rect];
#else
	DKQuartzCache* cache = [[self alloc] initWithContext:[NSGraphicsContext currentContext] forRect:rect];
#endif TARGET_OS_IPHONE
	return [cache autorelease];
}


//+ (DKQuartzCache*)	cacheForImage:(NSImage*) image
+ (DKQuartzCache*)	cacheForImage:(DKImage*) image
{
	NSAssert( image != nil, @"cannot create cache for nil image");
	
#if TARGET_OS_IPHONE
	DKQuartzCache* cache = [[self alloc] initWithContext:UIGraphicsGetCurrentContext() forRect:NSMakeRect( 0, 0, [image size].width, [image size].height )];
	[image drawAtPoint:NSZeroPoint blendMode:kCGBlendModeCopy alpha:1.0];
#else
	DKQuartzCache* cache = [[self alloc] initWithContext:[NSGraphicsContext currentContext] forRect:NSMakeRect( 0, 0, [image size].width, [image size].height )];
	[cache setFlipped:[image isFlipped]];
	[cache lockFocus];
	[image drawAtPoint:NSZeroPoint fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0];
	[cache unlockFocus];
#endif TARGET_OS_IPHONE
	
	return [cache autorelease];
}


#ifndef TARGET_OS_IPHONE
+ (DKQuartzCache*)	cacheForImageRep:(NSImageRep*) imageRep
{
	NSAssert( imageRep != nil, @"cannot create cache for nil image rep");
	
	DKQuartzCache* cache = [[self alloc] initWithContext:[NSGraphicsContext currentContext] forRect:NSMakeRect( 0, 0, [imageRep size].width, [imageRep size].height )];
	[cache lockFocus];
	[imageRep drawAtPoint:NSZeroPoint];
	[cache unlockFocus];
	
	return [cache autorelease];
}
#endif TARGET_OS_IPHONE



#pragma mark -


#if TARGET_OS_IPHONE
- (id)				initWithContext:(CGContextRef) context forRect:(NSRect) rect
#else
- (id)				initWithContext:(NSGraphicsContext*) context forRect:(NSRect) rect
#endif TARGET_OS_IPHONE
{
	NSAssert( context != nil, @"attempt to init cache with a nil context");
	NSAssert( !NSEqualSizes( rect.size, NSZeroSize ), @"cannot init cache with zero size" );
	
	self = [super init];
	if( self )
	{
		CGSize cg_size = CGSizeMake( NSWidth( rect ), NSHeight( rect ));
		mOrigin = rect.origin;
#if TARGET_OS_IPHONE
		mCGLayer = CGLayerCreateWithContext( context, cg_size, NULL );
#else
		CGContextRef port = [context graphicsPort];
		mCGLayer = CGLayerCreateWithContext( port, cg_size, NULL );
		[self setFlipped:[context isFlipped]];
#endif TARGET_OS_IPHONE
	}
	
	return self;
}



- (NSSize)			size
{
	CGSize cg_size = CGLayerGetSize( mCGLayer );
	return NSMakeSize( cg_size.width, cg_size.height );
}



- (CGContextRef)	context
{
	return CGLayerGetContext( mCGLayer );
}


- (void)			setFlipped:(BOOL) flipped
{
	mFlipped = flipped;
}


- (BOOL)			flipped
{
	return mFlipped;
}



- (void)			drawAtPoint:(NSPoint) point
{
	[self drawAtPoint:point operation:kCGBlendModeNormal fraction:1.0];
}


- (void)			drawAtPoint:(NSPoint) point operation:(CGBlendMode) op fraction:(CGFloat) frac
{
	CGPoint cg_point = CGPointMake( point.x, point.y );
#if TARGET_OS_IPHONE
	CGContextRef port = UIGraphicsGetCurrentContext();
#else
	CGContextRef port = [[NSGraphicsContext currentContext] graphicsPort];
#endif TARGET_OS_IPHONE
	CGContextSetAlpha(port, frac);
	CGContextSetBlendMode(port, op);
	CGContextDrawLayerAtPoint( port, cg_point, mCGLayer );
}



- (void)			drawInRect:(NSRect) rect
{
	CGRect cg_rect = CGRectMake( rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
#if TARGET_OS_IPHONE
	CGContextRef port = UIGraphicsGetCurrentContext();
#else
	CGContextRef port = [[NSGraphicsContext currentContext] graphicsPort];
#endif TARGET_OS_IPHONE
	CGContextDrawLayerInRect( port, cg_rect, mCGLayer );
}




- (void)			lockFocus
{
	// bracket drawing calls to establish what is cached by -lockFocus and -unlockFocus. The drawing must be done at {0,0}
	
	NSAssert( mFocusLocked == NO , @"lockFocus called while already locked");
	
#if TARGET_OS_IPHONE
   twlog("implement lockFocus");
   CGContextSaveGState(UIGraphicsGetCurrentContext());
#else
   [NSGraphicsContext saveGraphicsState];
	NSGraphicsContext* newContext = [NSGraphicsContext graphicsContextWithGraphicsPort:[self context] flipped:[self flipped]];
	[NSGraphicsContext setCurrentContext:newContext];
#endif TARGET_OS_IPHONE
	
	//NSAffineTransform* transform = [NSAffineTransform transform];
	DKAffineTransform* transform = [DKAffineTransform transform];
	[transform translateXBy:-mOrigin.x yBy:-mOrigin.y];
	[transform concat];
	
	mFocusLocked = YES;
}



- (void)			unlockFocus
{
	NSAssert( mFocusLocked == YES, @"unlockFocus called without a matching lockFocus");
	
#if TARGET_OS_IPHONE
   CGContextRestoreGState(UIGraphicsGetCurrentContext());
#else
   [NSGraphicsContext restoreGraphicsState];
#endif TARGET_OS_IPHONE
	mFocusLocked = NO;
}


#pragma mark -
#pragma mark - as a NSObject

- (void)			dealloc
{
	if( mFocusLocked )
		[self unlockFocus];
	
	CGLayerRelease( mCGLayer );
	[super dealloc];
}



@end
