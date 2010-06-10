//
//  DKSelectionPDFView.h
///  DrawKit �2005-2008 Apptree.net
//
//  Created by graham on 30/09/2006.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
//

#if TARGET_OS_IPHONE
#import "DKTDrawingView.h"
#else
#import "DKDrawingView.h"
#endif TARGET_OS_IPHONE

@class DKDrawableObject, DKObjectOwnerLayer, DKShapeGroup;


#if TARGET_OS_IPHONE
@interface DKSelectionPDFView : DKTDrawingView
#else
@interface DKSelectionPDFView : DKDrawingView
#endif TARGET_OS_IPHONE
@end



@class DKObjectOwnerLayer, DKShapeGroup;


#if TARGET_OS_IPHONE
@interface DKLayerPDFView : DKTDrawingView
#else
@interface DKLayerPDFView : DKDrawingView
#endif TARGET_OS_IPHONE
{
	DKLayer* mLayerRef;
}

- (id)		initWithFrame:(NSRect) frame withLayer:(DKLayer*) aLayer;

@end


#if TARGET_OS_IPHONE
@interface DKDrawablePDFView : UIView
#else
@interface DKDrawablePDFView : NSView
#endif TARGET_OS_IPHONE
{
	DKDrawableObject*	mObjectRef;
}

- (id)		initWithFrame:(NSRect) frame object:(DKDrawableObject*) obj;


@end

/* these objects are never used to make a visible view. Their only function is to allow parts of a drawing to be
 selectively written to a PDF. This is made by DKObjectDrawingLayer internally and is private to the DrawKit.
 
 */
