//
//  GCInfoFloater.h
///  DrawKit �2005-2008 Apptree.net
//
//  Created by graham on 02/10/2006.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
//

@class DKDrawingView;

#if TARGET_OS_IPHONE
@interface GCInfoFloater : UIView
#else
@interface GCInfoFloater : NSWindow
#endif TARGET_OS_IPHONE
{
@private
#if TARGET_OS_IPHONE
	UILabel*		m_infoViewRef;
   NSNumberFormatter* m_formatter;
#else
	NSControl*		m_infoViewRef;
#endif TARGET_OS_IPHONE
	NSSize			m_wOffset;
}


+ (GCInfoFloater*)	infoFloater;

- (void)			setFloatValue:(float) val;
- (void)			setDoubleValue:(double) val;
- (void)			setStringValue:(NSString*) str;

- (void)			setFormat:(NSString*) fmt;
- (void)			setWindowOffset:(NSSize) offset;
//- (void)			positionNearPoint:(NSPoint) p inView:(NSView*) v;
- (void)			positionNearPoint:(NSPoint) p inView:(DKDrawingView*) v;
- (void)			positionAtScreenPoint:(NSPoint) sp;

- (void)			show;
- (void)			hide;

@end


/*

This class provides a very simple tooltip-like window in which you can display a short piece of information, such
as a single numeric value.

By positioning this next to the mouse and supplying it with info, you can enhance the usability of some kinds of
user interaction.

*/

