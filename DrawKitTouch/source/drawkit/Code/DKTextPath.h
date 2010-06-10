//
//  DKTextPath.h
//  GCDrawKit
//
//  Created by graham on 25/11/2008.
//  Copyright 2008 Apptree.net. All rights reserved.
//

#import "DKDrawablePath.h"
#import "DKCommonTypes.h"



@class DKTextAdornment, DKDrawingView;


@interface DKTextPath : DKDrawablePath <NSCopying, NSCoding>
{
@private
	DKTextAdornment*		mTextAdornment;
#ifndef TARGET_OS_IPHONE
	NSTextView*				mEditorRef;
#endif TARGET_OS_IPHONE
	BOOL					mIsSettingStyle;
}

// convenience constructors:

//+ (DKTextPath*)				textPathWithString:(NSString*) str onPath:(NSBezierPath*) aPath;
+ (DKTextPath*)				textPathWithString:(NSString*) str onPath:(DKBezierPath*) aPath;

// class defaults:

+ (void)					setDefaultTextString:(NSString*) str;
+ (NSString*)				defaultTextString;
+ (Class)					textAdornmentClass;
+ (NSArray*)				pastableTextTypes;
+ (DKStyle*)				textPathDefaultStyle;

// the text:

- (void)					setText:(id) contents;
#ifndef TARGET_OS_IPHONE
- (NSTextStorage*)			text;
#endif TARGET_OS_IPHONE
- (NSString*)				string;

//- (void)					pasteTextFromPasteboard:(NSPasteboard*) pb ignoreFormatting:(BOOL) fmt;
//- (BOOL)					canPasteText:(NSPasteboard*) pb;
- (void)					pasteTextFromPasteboard:(DKPasteboard*) pb ignoreFormatting:(BOOL) fmt;
- (BOOL)					canPasteText:(DKPasteboard*) pb;

// conversion to path/shape with text path:

//- (NSBezierPath*)			textPath;
- (DKBezierPath*)			textPath;
- (NSArray*)				textPathGlyphs;
- (NSArray*)				textPathGlyphsUsedSize:(NSSize*) textSize;
- (DKDrawablePath*)			makePathWithText;
- (DKDrawableShape*)		makeShapeWithText;
- (DKShapeGroup*)			makeShapeGroupWithText;
- (DKStyle*)				styleWithTextAttributes;
- (DKStyle*)				syntheticStyle;

// text attributes - accesses the internal adornment object

- (NSDictionary*)			textAttributes;

//- (void)					setFont:(NSFont*) font;
//- (NSFont*)					font;
- (void)					setFont:(DKFont*) font;
- (DKFont*)					font;
- (void)					setFontSize:(CGFloat) size;
- (CGFloat)					fontSize;
//- (void)					setTextColour:(NSColor*) colour;
//- (NSColor*)				textColour;
- (void)					setTextColour:(DKColor*) colour;
- (DKColor*)				textColour;

- (void)					scaleTextBy:(CGFloat) factor;

// paragraph style attributes:

- (void)					setVerticalAlignment:(DKVerticalTextAlignment) align;
- (DKVerticalTextAlignment)	verticalAlignment;
- (void)					setVerticalAlignmentProportion:(CGFloat) prop;
- (CGFloat)					verticalAlignmentProportion;
#ifndef TARGET_OS_IPHONE
- (void)					setParagraphStyle:(NSParagraphStyle*) ps;
- (NSParagraphStyle*)		paragraphStyle;
#endif TARGET_OS_IPHONE
//- (NSTextAlignment)			alignment;
- (DKTextAlignment)			alignment;

- (void)					setLayoutMode:(DKTextLayoutMode) mode;
- (DKTextLayoutMode)		layoutMode;

// editing the text:

- (void)					startEditingInView:(DKDrawingView*) view;
- (void)					endEditing;
- (BOOL)					isEditing;

// the internal adornment object:

- (DKTextAdornment*)		textAdornment;
- (void)					setTextAdornment:(DKTextAdornment*) adornment;

// user actions:

#ifndef TARGET_OS_IPHONE
- (IBAction)				changeFont:(id) sender;
#endif TARGET_OS_IPHONE
- (IBAction)				changeFontSize:(id) sender;
#ifndef TARGET_OS_IPHONE
- (IBAction)				changeAttributes:(id) sender;
#endif TARGET_OS_IPHONE
- (IBAction)				editText:(id) sender;

- (IBAction)				changeLayoutMode:(id) sender;

- (IBAction)				alignLeft:(id) sender;
- (IBAction)				alignRight:(id) sender;
- (IBAction)				alignCenter:(id) sender;
#ifndef TARGET_OS_IPHONE
- (IBAction)				alignJustified:(id) sender;
#endif TARGET_OS_IPHONE
- (IBAction)				underline:(id) sender;

- (IBAction)				loosenKerning:(id) sender;
- (IBAction)				tightenKerning:(id) sender;
- (IBAction)				turnOffKerning:(id)sender;
- (IBAction)				useStandardKerning:(id) sender;

- (IBAction)				lowerBaseline:(id) sender;
- (IBAction)				raiseBaseline:(id) sender;
- (IBAction)				superscript:(id) sender;
- (IBAction)				subscript:(id) sender;
- (IBAction)				unscript:(id) ssender;

- (IBAction)				verticalAlign:(id) sender;
- (IBAction)				convertToShape:(id) sender;
- (IBAction)				convertToShapeGroup:(id) sender;
- (IBAction)				convertToTextShape:(id) sender;
- (IBAction)				convertToPath:(id) sender;

- (IBAction)				paste:(id) sender;
- (IBAction)				capitalize:(id) sender;

- (IBAction)				takeTextAlignmentFromSender:(id) sender;
- (IBAction)				takeTextVerticalAlignmentFromSender:(id) sender;

@end


/*

Very similar to a DKTextShape but based on a path and defaulting to text-on-a-path rendering. Has virtually identical public API to DKTextShape.

*/


