///**********************************************************************************************************************************
///  DKStyle+SimpleAccess.h
///  DrawKit ©2005-2008 Apptree.net
///
///  Created by graham on 08/07/2008.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

#import "DKStyle.h"


@class DKStrokeDash, DKStroke, DKFill;



@interface DKStyle (SimpleAccess)

//+ (DKStyle*)		styleWithDotDensity:(CGFloat) percent foreColour:(NSColor*) fore backColour:(NSColor*) back;
+ (DKStyle*)		styleWithDotDensity:(CGFloat) percent foreColour:(DKColor*) fore backColour:(DKColor*) back;

- (DKStroke*)		stroke;
- (DKFill*)			fill;

//- (void)			setFillColour:(NSColor*) fillColour;
//- (NSColor*)		fillColour;
- (void)			setFillColour:(DKColor*) fillColour;
- (DKColor*)		fillColour;

//- (void)			setStrokeColour:(NSColor*) strokeColour;
//- (NSColor*)		strokeColour;
- (void)			setStrokeColour:(DKColor*) strokeColour;
- (DKColor*)		strokeColour;

- (void)			setStrokeWidth:(CGFloat) strokeWidth;
- (CGFloat)			strokeWidth;

- (void)			setStrokeDash:(DKStrokeDash*) aDash;
- (DKStrokeDash*)	strokeDash;

- (void)			setStrokeLineCapStyle:(NSLineCapStyle) capStyle;
- (NSLineCapStyle)	strokeLineCapStyle;

- (void)			setStrokeLineJoinStyle:(NSLineJoinStyle) joinStyle;
- (NSLineJoinStyle)	strokeLineJoinStyle;

- (void)			setString:(NSString*) aString;
- (NSString*)		string;

- (BOOL)			hasImageComponent;
//- (void)			setImageComponent:(NSImage*) anImage;
//- (NSImage*)		imageComponent;
- (void)			setImageComponent:(DKImage*) anImage;
- (DKImage*)		imageComponent;

@end


/*

This category on DKStyle provides some simple accessors if your app only has the most basic use of styles in mind, e.g. one solid fill and
a single simple solid or dashed stroke.

This operates on the topmost DKStroke/DKFill rasterizers in a style's list, and does not touch any others. By passing a colour of nil, the
associated rasterizer is disabled. If a non-nil colour is passed, and there is no suitable rasterizer, one is created and added. If the
rasterizer has to be created for both properies, the stroke will be placed in front of the fill.

Note that this does not require or use and specially created style. It is recommended that if using these accessors, style sharing is
turned off so that every object has its own style - then these accessors effectively operate on the graphic object's stroke and fill properties. 
 
The string setter sets or creates a DKTextAdornment component having the default text parameters and the string as its label.

If the style is locked these do nothing.

*/


