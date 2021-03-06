///**********************************************************************************************************************************
///  DKImageAdornment.h
///  DrawKit ©2005-2008 Apptree.net
///
///  Created by graham on 15/05/2007.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

#import "DKRasterizer.h"


@class DKDrawableObject, DKDrawing;

// fitting options:

typedef enum
{
	kDKScaleToFitBounds					= 0,			// scale setting ignored - image will fill bounds
	kDKScaleToFitPreservingAspectRatio	= 1,			// scale setting ignored - image will fit bounds with original aspect ratio preserved
	kDKClipToBounds						= 2				// scales according to setting, but clipped to object's path if size exceeds it
}
DKImageFittingOption;




@interface DKImageAdornment : DKRasterizer <NSCoding, NSCopying>
{
@private
	NSString*				mImageKey;
	//NSImage*				m_image;
	DKImage*				m_image;
	CGFloat					m_scale;
	CGFloat					m_opacity;
	CGFloat					m_angle;
	NSPoint					m_origin;
#if TARGET_OS_IPHONE
	CGBlendMode	m_op;
#else
	NSCompositingOperation	m_op;
#endif TARGET_OS_IPHONE
	DKImageFittingOption	m_fittingOption;
	NSString*				m_imageIdentifier;
}

//+ (DKImageAdornment*)	imageAdornmentWithImage:(NSImage*) image;
+ (DKImageAdornment*)	imageAdornmentWithImage:(DKImage*) image;
+ (DKImageAdornment*)	imageAdornmentWithImageFromFile:(NSString*) path;

//- (void)				setImage:(NSImage*) image;
//- (NSImage*)			image;
- (void)				setImage:(DKImage*) image;
- (DKImage*)			image;

- (void)				setImageWithKey:(NSString*) key forDrawing:(DKDrawing*) drawing;
- (void)				setImageKey:(NSString*) key;
- (NSString*)			imageKey;

- (void)				setImageIdentifier:(NSString*) imageID;
- (NSString*)			imageIdentifier;

- (void)				setScale:(CGFloat) scale;
- (CGFloat)				scale;

- (void)				setOpacity:(CGFloat) opacity;
- (CGFloat)				opacity;

- (void)				setOrigin:(NSPoint) origin;
- (NSPoint)				origin;

- (void)				setAngle:(CGFloat) angle;
- (CGFloat)				angle;
- (void)				setAngleInDegrees:(CGFloat) degrees;
- (CGFloat)				angleInDegrees;

#if TARGET_OS_IPHONE
- (void)				setOperation:(CGBlendMode) op;
- (CGBlendMode) operation;
#else
- (void)				setOperation:(NSCompositingOperation) op;
- (NSCompositingOperation) operation;
#endif TARGET_OS_IPHONE

- (void)				setFittingOption:(DKImageFittingOption) fopt;
- (DKImageFittingOption) fittingOption;

//- (NSAffineTransform*)	imageTransformForObject:(id<DKRenderable>) renderableObject;
- (DKAffineTransform*)	imageTransformForObject:(id<DKRenderable>) renderableObject;

@end



/*

This class allows any image to be part of the rendering tree. 

*/
