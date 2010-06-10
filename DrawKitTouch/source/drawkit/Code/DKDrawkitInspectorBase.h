///**********************************************************************************************************************************
///  DKDrawkitInspectorBase.h
///  DrawKit ©2005-2008 Apptree.net
///
///  Created by graham on 06/05/2007.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

// not in iPhone SDK, should be left to .pch ...alex
//#import <Cocoa/Cocoa.h>


@class DKDrawing, DKLayer, DKDrawableObject, DKViewController;
#ifndef TARGET_OS_IPHONE
@class DKDrawingDocument;
#endif TARGET_OS_IPHONE


#if TARGET_OS_IPHONE
@interface DKDrawkitInspectorBase : UIViewController
#else
@interface DKDrawkitInspectorBase : NSWindowController
#endif TARGET_OS_IPHONE

- (void)				documentDidChange:(NSNotification*) note;
- (void)				layerDidChange:(NSNotification*) note;
- (void)				selectedObjectDidChange:(NSNotification*) note;
- (void)				subSelectionDidChange:(NSNotification*) note;

- (void)				redisplayContentForSelection:(NSArray*) selection;
- (void)				redisplayContentForSubSelection:(NSSet*) subsel ofObject:(DKDrawableObject*) object;

- (id)					selectedObjectForCurrentTarget;
//- (id)					selectedObjectForTargetWindow:(NSWindow*) window;
- (id)					selectedObjectForTargetWindow:(DKWindow*) window;
#if TARGET_OS_IPHONE
- (DKDrawing*)			drawingForTargetView:(UIView*)view;
#endif TARGET_OS_IPHONE
//- (DKDrawing*)			drawingForTargetWindow:(NSWindow*) window;
- (DKDrawing*)			drawingForTargetWindow:(DKWindow*) window;

// these return what they say when the app is in a static state. When responding to documentDidChange:, they can return nil
// because Cocoa's notifications are sent too early. In that case you should respond to the notification directly and
// extract the relevant DK objects working back from the window. It sucks, I know.

#ifndef TARGET_OS_IPHONE
- (DKDrawingDocument*)	currentDocument;
#endif TARGET_OS_IPHONE
- (DKDrawing*)			currentDrawing;
- (DKLayer*)			currentActiveLayer;

- (DKViewController*)	currentMainViewController;

@end



/*

This is a base class for any inspector for looking at DrawKit. All it does is respond to the various selection changed
notifications at the document, layer and object levels, and call a method which you can override to set up the displayed
content.


*/
