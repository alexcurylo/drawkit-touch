///**********************************************************************************************************************************
///  DKDrawingInfoLayer.h
///  DrawKit �2005-2008 Apptree.net
///
///  Created by graham on 27/08/2006.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

#import "DKLayer.h"


// placement of info panel:

typedef enum
{
	kDKDrawingInfoPlaceBottomRight		= 0,
	kDKDrawingInfoPlaceBottomLeft		= 1,
	kDKDrawingInfoPlaceTopLeft			= 2,
	kDKDrawingInfoPlaceTopRight			= 3
}
DKInfoBoxPlacement;



@interface DKDrawingInfoLayer : DKLayer <NSCoding>
{
	DKInfoBoxPlacement	m_placement;			// which corner is the panel placed in
	NSSize				m_size;					// the size of the panel
	NSString*			m_editingKeyRef;		// which info key is being edited
	BOOL				m_drawBorder;			// YES if a border is drawn around the drawing
}

// general settings:

- (void)				setSize:(NSSize) size;
- (NSSize)				size;

- (void)				setPlacement:(DKInfoBoxPlacement) placement;
- (DKInfoBoxPlacement)	placement;

//- (void)				setBackgroundColour:(NSColor*) colour;
//- (NSColor*)			backgroundColour;
- (void)				setBackgroundColour:(DKColor*) colour;
- (DKColor*)			backgroundColour;

- (void)				setDrawsBorder:(BOOL) border;
- (BOOL)				drawsBorder;

// internal stuff:

- (NSRect)				infoBoxRect;
- (void)				drawInfoInRect:(NSRect) br;
- (NSDictionary*)		attributesForDrawingInfoItem:(NSString*) key;
- (void)				drawString:(NSString*) str inRect:(NSRect) r withAttributes:(NSDictionary*) attr;

- (NSAttributedString*)	labelForDrawingInfoItem:(NSString*) key;
- (NSRect)				layoutRectForDrawingInfoItem:(NSString*) key inRect:(NSRect) bounds;
- (NSRect)				labelRectInRect:(NSRect) itemRect forLabel:(NSAttributedString*) ls;

- (NSString*)			keyForEditableRegionUnderMouse:(NSPoint) p;
- (void)				textViewDidChangeSelection:(NSNotification*) aNotification;

@end


extern NSString*	kDKDrawingInfoTextLabelAttributes;


/*

This is a DKLayer subclass which is able to draw an information panel in a corner of the drawing.

The info panel takes data from DKDrawing's metadata dictionary ind displays some of it - standard
keys such as the drawing number, name of the draughtsman, creation and modification dates and so on.

This can also directly edit the same information.

This is not a very important class within DK, and mays apps will not want to use it, or to use it in
modified form. It is provided as another example of how to implement layer subclasses as much as anything.



*/

