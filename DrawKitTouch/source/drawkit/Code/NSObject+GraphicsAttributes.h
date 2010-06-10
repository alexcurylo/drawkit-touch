///**********************************************************************************************************************************
///  NSObject+GraphicsAttributes.h
///  DrawKit �2005-2008 Apptree.net
///
///  Created by graham on 09/03/2007.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

// not in iPhone SDK, should be left to .pch ...alex
//#import <Cocoa/Cocoa.h>


@class DKExpression;


@interface NSObject (GraphicsAttributes)

- (id)			initWithExpression:(DKExpression*) expr;
- (void)		setValue:(id) val forNumericParameter:(NSInteger) pnum;

//- (NSImage*)	imageResourceNamed:(NSString*) name;
- (DKImage*)	imageResourceNamed:(NSString*) name;


@end
