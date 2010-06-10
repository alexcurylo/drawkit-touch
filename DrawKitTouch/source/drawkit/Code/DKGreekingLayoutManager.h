//
//  DKGreekingLayoutManager.h
//  GCDrawKit
//
//  Created by graham on 13/05/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

#if TARGET_OS_IPHONE
#error NSLayoutManager not available in iPhone SDK
#endif TARGET_OS_IPHONE

#import "DKCommonTypes.h"




@interface DKGreekingLayoutManager : NSLayoutManager
{
	DKGreeking		mGreeking;
	//NSColor*		mGreekingColour;
	DKColor*		mGreekingColour;
}

- (void)			setGreeking:(DKGreeking) greeking;
- (DKGreeking)		greeking;

//- (void)			setGreekingColour:(NSColor*) aColour;
//- (NSColor*)		greekingColour;
- (void)			setGreekingColour:(DKColor*) aColour;
- (DKColor*)		greekingColour;

@end


/*

 This layout manager subclass draws greeking rectangles instead of glyphs, either as entire line fragement rectangles or as glyph rectangles.
 
 Greeking can be faster for certain operations such as hit-testing where exact glyph rendition is not needed.

*/

