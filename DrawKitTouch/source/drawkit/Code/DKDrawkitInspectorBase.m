///**********************************************************************************************************************************
///  DKDrawkitInspectorBase.m
///  DrawKit ©2005-2008 Apptree.net
///
///  Created by graham on 06/05/2007.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

#import "DKDrawkitInspectorBase.h"
#import "DKDrawableObject.h"
#import "DKDrawing.h"
#import "DKObjectDrawingLayer.h"
#if TARGET_OS_IPHONE
#import "DKTDrawingView.h"
#else
#import "DKDrawingDocument.h"
#import "DKDrawingView.h"
#endif TARGET_OS_IPHONE
#import "LogEvent.h"

@implementation DKDrawkitInspectorBase
#pragma mark As a DKDrawkitInspectorBase


- (void)				documentDidChange:(NSNotification*) note
{
	LogEvent_(kReactiveEvent, @"document did change (%@), window = %@", [note name], [note object]);
	
#if TARGET_OS_IPHONE
	if([[note name] isEqualToString:UIWindowDidResignKeyNotification])
#else
	if([[note name] isEqualToString:NSWindowDidResignMainNotification])
#endif TARGET_OS_IPHONE
		[self redisplayContentForSelection:nil];
	else
		[self redisplayContentForSelection:[self selectedObjectForTargetWindow:[note object]]];
}


- (void)				layerDidChange:(NSNotification*) note
{
	#pragma unused(note)
	
	LogEvent_(kReactiveEvent, @"%@ received layer change (%@), layer = %@", self, [note name], [note object]);

	[self redisplayContentForSelection:[self selectedObjectForCurrentTarget]];
}


- (void)				selectedObjectDidChange:(NSNotification*) note
{
	if([[note object] respondsToSelector:@selector(selection)])
	{
		LogEvent_(kReactiveEvent, @"selection did change (%@), selected = %@", [note name], [[note object] selection]);
		
		[[NSNotificationCenter defaultCenter] removeObserver:self name:kDKDrawableSubselectionChangedNotification object:nil];
		
		NSArray* sel = [self selectedObjectForCurrentTarget];
		[self redisplayContentForSelection:sel];
		
		NSEnumerator* iter = [sel objectEnumerator];
		id				obj;
		
		while(( obj = [iter nextObject]))
			[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subSelectionDidChange:) name:kDKDrawableSubselectionChangedNotification object:obj];

	}
}


- (void)				subSelectionDidChange:(NSNotification*) note
{
	
	DKDrawableObject* obj = (DKDrawableObject*)[note object];
	NSSet* subsel = [obj subSelection];
	
	[self redisplayContentForSubSelection:subsel ofObject:obj];
}


#pragma mark -
- (void)				redisplayContentForSelection:(NSArray*) selection
{
	#pragma unused(selection)
	
	// override to do something useful
}


- (void)				redisplayContentForSubSelection:(NSSet*) subsel ofObject:(DKDrawableObject*) object
{
#pragma unused(subsel, object )
	
	NSLog(@"subselection of <%@ 0x%x> changed: %@", NSStringFromClass([object class]), object, subsel );
	
	// override to do something useful
}


#pragma mark -
- (id)					selectedObjectForCurrentTarget
{
	// this determines what object in the currently active document is selected. It can return different things:
	// 1. nil, meaning that nothing available is selected or that the current document isn't a drawing
	// 2. an array of drawable objects, being the available selected objects. Array may only contain 1 item. 
	
	DKDrawing* drawing = [self currentDrawing];
	DKLayer* layer = [drawing activeLayerOfClass:[DKObjectDrawingLayer class]];
			
	if ( layer != nil )
	{
		// yes - so just return its current selection, including locked objects but not hidden ones.
		
		NSArray* sel = [(DKObjectDrawingLayer*)layer selectedVisibleObjects];
		return sel;
	}

	return nil;
}

#if TARGET_OS_IPHONE
- (DKDrawing*)			drawingForTargetView:(UIView*)view
{
   if ([view isKindOfClass:[DKTDrawingView class]])
      return [(DKTDrawingView *)view drawing];
   
   for (UIView *subview in view.subviews)
   {
      DKDrawing *drawing = [self drawingForTargetView:subview];
      if (drawing)
         return drawing;
   }
   
   return nil;
}
#endif TARGET_OS_IPHONE

//- (DKDrawing*)			drawingForTargetWindow:(NSWindow*) window
- (DKDrawing*)			drawingForTargetWindow:(DKWindow*) window
{
#if TARGET_OS_IPHONE
   return [self drawingForTargetView:window];
#else
	NSDocument* cd = [[NSDocumentController sharedDocumentController] documentForWindow:window];
	DKDrawing*	drawing = nil;
	
	// contains a drawing? (Note - if you implement your own drawing document type you may need to modify this)
	
	if ([cd respondsToSelector:@selector(drawing)])
		drawing = [(id)cd drawing];
		
	if ( drawing != nil && [drawing isKindOfClass:[DKDrawing class]])
		return drawing;
		
	return nil;
#endif TARGET_OS_IPHONE
}


//- (id)					selectedObjectForTargetWindow:(NSWindow*) window
- (id)					selectedObjectForTargetWindow:(DKWindow*) window
{
	DKDrawing*	drawing = [self drawingForTargetWindow:window];
	
	if ( drawing != nil)
	{
		DKLayer* layer = [drawing activeLayerOfClass:[DKObjectDrawingLayer class]];
			
		if ( layer != nil )
		{
			// yes - so just return its current selection
			
			return [(DKObjectDrawingLayer*)layer selectedAvailableObjects];
		}
	}
	return nil;
}


#pragma mark -

#ifndef TARGET_OS_IPHONE
- (DKDrawingDocument*)	currentDocument
{
	NSDocument* cd = [[NSDocumentController sharedDocumentController] currentDocument];
	
	if([cd isKindOfClass:[DKDrawingDocument class]])
		return (DKDrawingDocument*) cd;
	else
		return nil;
}
#endif TARGET_OS_IPHONE


- (DKDrawing*)			currentDrawing
{
#if TARGET_OS_IPHONE
   return [self drawingForTargetWindow:[UIApplication sharedApplication].keyWindow];
#else
	DKDrawingDocument* cd = [self currentDocument];
	
	if ( cd )
		return [cd drawing];
	else
		return nil;
#endif TARGET_OS_IPHONE
}


- (DKLayer*)			currentActiveLayer
{
	return [[self currentDrawing] activeLayer];
}



- (DKViewController*)	currentMainViewController
{
	// returns the controller for the current main view IFF it is a DKDrawingView, otherwise nil
	
#if TARGET_OS_IPHONE
	id firstR = [[[UIApplication sharedApplication] keyWindow] findFirstResponder];
#else
	id firstR = [[NSApp mainWindow] firstResponder];
#endif TARGET_OS_IPHONE
   
	if([firstR isKindOfClass:[DKDrawingView class]])
		return [(DKDrawingView*)firstR controller];
	
	return nil;
}


#pragma mark -
#pragma mark As an NSWindowController
- (void)				showWindow:(id) sender
{
#if TARGET_OS_IPHONE
   (void)sender;
   twlog("showWindow called on an inspector controller!");
   twcheck(self.view.superview);
	self.view.hidden = NO;
#else
	[super showWindow:sender];
#endif TARGET_OS_IPHONE
	[self redisplayContentForSelection:[self selectedObjectForCurrentTarget]];
}


- (void)				dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}


- (void)				windowDidLoad
{
	[self redisplayContentForSelection:[self selectedObjectForCurrentTarget]];
}


#pragma mark -
#pragma mark As part of NSNibAwaking Protocol
- (void)				awakeFromNib
{
	// sets up the notifications - call super if you override it

#if TARGET_OS_IPHONE
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(documentDidChange:) name:UIWindowDidBecomeKeyNotification object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(documentDidChange:) name:UIWindowDidResignKeyNotification object:nil];
#else
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(documentDidChange:) name:NSWindowDidBecomeMainNotification object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(documentDidChange:) name:NSWindowDidResignMainNotification object:nil];
#endif TARGET_OS_IPHONE

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layerDidChange:) name:kDKDrawingActiveLayerDidChange object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectedObjectDidChange:) name:kDKLayerSelectionDidChange object:nil];
}


@end
