///**********************************************************************************************************************************
///  DKStyle-Text.m
///  DrawKit �2005-2008 Apptree.net
///
///  Created by graham on 21/09/2006.
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************


#import "DKStyle+Text.h"
#import "DKFill.h"
#import "DKStroke.h"
#import "DKStyleRegistry.h"


static NSString* kDKBasicTextStyleDefaultKey	= @"326CF635-7863-42C6-900D-CFFC7D57505E";


@implementation DKStyle (TextAdditions)
#pragma mark As a DKStyle

///****************************************************************************************************************
///
/// method:			defaultTextStyle
/// scope:			public class method
/// overrides:
/// description:	returns a basic text style with the default font and atrributes
/// 
/// parameters:		none
/// result:			a style having 18pt Helvetica centred text
///
/// notes:			
///
///***************************************************************************************************************

+ (DKStyle*)		defaultTextStyle
{
	// default text style is a singleton with no fill or stroke, Helvetica 18 regular centred text
	
	DKStyle*		dts = [DKStyleRegistry styleForKey:kDKBasicTextStyleDefaultKey];
	
	if ( dts == nil )
	{
		//NSFont* font = [NSFont fontWithName:@"Helvetica" size:14];
		DKFont* font = [DKFont fontWithName:@"Helvetica" size:14];
		
		dts = [[DKStyle alloc] init];
		[dts setFont:font];
		//[dts setAlignment:NSCenterTextAlignment];
		[dts setAlignment:DKCenterTextAlignment];
		[dts setName:[self styleNameForFont:font]];
		
		// because this is a framework default, its unique key must always be recreated the same. This is not something any client
		// code or other part of the framework should ever attempt.

		dts->m_uniqueKey = kDKBasicTextStyleDefaultKey;
		
		[DKStyleRegistry registerStyle:dts inCategories:[NSArray arrayWithObject:kDKStyleRegistryDKDefaultsCategory]];
		[dts release];
	}
	
	return dts;
}


///****************************************************************************************************************
///
/// method:			textStyleWithFont:
/// scope:			public class method
/// overrides:
/// description:	returns a basic text style with the given font
/// 
/// parameters:		<font> a font
/// result:			a style incorporating the given font in its text attributes
///
/// notes:			the style's name is set based on the font. Initial text alignment is the natural alignment.
///
///***************************************************************************************************************

//+ (DKStyle*)		textStyleWithFont:(NSFont*) font
+ (DKStyle*)		textStyleWithFont:(DKFont*) font
{
	NSAssert( font != nil, @"cannot create a style with a nil font");
	
	DKStyle*	ts = [[DKStyle defaultTextStyle] mutableCopy];
	[ts setFont:font];
#if TARGET_OS_IPHONE
	[ts setAlignment:UITextAlignmentLeft];
#else
	[ts setAlignment:NSNaturalTextAlignment];
#endif TARGET_OS_IPHONE
	[ts setName:[self styleNameForFont:font]];
	
	return [ts autorelease];
}


///****************************************************************************************************************
///
/// method:			styleNameForFont:
/// scope:			public class method
/// overrides:
/// description:	returns the name and size of the font in a form that can be used as a style name
/// 
/// parameters:		<font> a font
/// result:			a string, such as "Helvetica Bold 18pt"
///
/// notes:			
///
///***************************************************************************************************************

//+ (NSString*)			styleNameForFont:(NSFont*) font
+ (NSString*)			styleNameForFont:(DKFont*) font
{
#if TARGET_OS_IPHONE
	return [NSString stringWithFormat:@"%@ %.1fpt", font.fontName, [font pointSize]];
#else
	return [NSString stringWithFormat:@"%@ %.1fpt", [font displayName], [font pointSize]];
#endif TARGET_OS_IPHONE
}


#pragma mark -

#ifndef TARGET_OS_IPHONE
- (void)				setParagraphStyle:(NSParagraphStyle*) style
{
	[self changeTextAttribute:NSParagraphStyleAttributeName toValue:style];
}
#endif TARGET_OS_IPHONE


#ifndef TARGET_OS_IPHONE
- (NSParagraphStyle*)	paragraphStyle
{
	return [[self textAttributes] objectForKey:NSParagraphStyleAttributeName];
}
#endif TARGET_OS_IPHONE


#pragma mark -
//- (void)				setAlignment:(NSTextAlignment) align
- (void)				setAlignment:(DKTextAlignment) align
{
#if TARGET_OS_IPHONE
   (void)align;
   twlog("implement setAlignment");
#else
	if(![self locked])
	{
		NSMutableParagraphStyle* mps = [[self paragraphStyle] mutableCopy];
		
		if ( mps == nil )
			mps = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
		
		[mps setAlignment:align];
		[self setParagraphStyle:mps];
		[mps release];
		
		NSString* actionName = nil;
		
		switch( align )
		{
			default:
			//case NSLeftTextAlignment:
			case DKLeftTextAlignment:
				actionName = NSLocalizedString(@"Align Left", @"undo string for align text left");
				break;
				
			//case NSRightTextAlignment:
			case DKRightTextAlignment:
				actionName = NSLocalizedString(@"Align Right", @"undo string for align text right");
				break;
				
			//case NSCenterTextAlignment:
			case DKCenterTextAlignment:
				actionName = NSLocalizedString(@"Align Center", @"undo string for align text centre");
				break;
				
#ifndef TARGET_OS_IPHONE
			case NSJustifiedTextAlignment:
				actionName = NSLocalizedString(@"Justify Text", @"undo string for align justify");
				break;
#endif TARGET_OS_IPHONE
		}
		
		[[self undoManager] setActionName:actionName];
	}
#endif TARGET_OS_IPHONE
}


//- (NSTextAlignment)		alignment
- (DKTextAlignment)		alignment
{
#if TARGET_OS_IPHONE
   twlog("implement alignment");
   return UITextAlignmentLeft;
#else
	return [[self paragraphStyle] alignment];
#endif TARGET_OS_IPHONE
}


#pragma mark -

- (void)				changeTextAttribute:(NSString*) attribute toValue:(id) val
{
	if(![self locked])
	{
		//LogEvent_(kReactiveEvent, @"style changing text attribute '%@'", attribute);
		
		NSAssert( attribute != nil, @"attribute was nil");
		NSAssert([attribute length] > 0, @"attribute was empty");
		
		NSMutableDictionary*	attr = [[self textAttributes] mutableCopy];
		
		if ( attr == nil )
			attr = [[NSMutableDictionary alloc] init];
		
		if( val == nil )
			[attr removeObjectForKey:attribute];
		else
			[attr setObject:val forKey:attribute];
		[self setTextAttributes:attr];
		[attr release];
		[[self undoManager] setActionName:[self actionNameForTextAttribute:attribute]];
	}
}


- (NSString*)			actionNameForTextAttribute:(NSString*) attribute
{
	// returns the undo action name for a particular text attribute
	
#if TARGET_OS_IPHONE
   (void)attribute;
   twlog("implement actionNameForTextAttribute");
   return nil;
#else
	NSString* raw;
	
	if ([attribute isEqualToString:NSFontAttributeName])
		raw = @"Change Font";
	else if ([attribute isEqualToString:NSUnderlineStyleAttributeName])
		raw = @"Underline";
	else if ([attribute isEqualToString:NSParagraphStyleAttributeName])
		raw = @"Paragraph Style";
	else
		raw = @"Text Attributes";
		
	return NSLocalizedString( raw, @"style text attribute undo string" );
#endif TARGET_OS_IPHONE
}



#pragma mark -
//- (void)				setFont:(NSFont*) font
- (void)				setFont:(DKFont*) font
{
	if(![self locked])
	{
#if TARGET_OS_IPHONE
      (void)font;
      twlog("implement setFont");
#else
		[self changeTextAttribute:NSFontAttributeName toValue:font];
		[[self undoManager] setActionName:[self actionNameForTextAttribute:NSFontAttributeName]];
#endif TARGET_OS_IPHONE
	}
}


//- (NSFont*)				font
- (DKFont*)				font
{
#if TARGET_OS_IPHONE
   twlog("implement font");
   return nil;
#else
	return [[self textAttributes] objectForKey:NSFontAttributeName];
#endif TARGET_OS_IPHONE
}


- (void)				setFontSize:(CGFloat) size
{
	if(![self locked])
	{
#if TARGET_OS_IPHONE
		UIFont* newFont = [self.font fontWithSize:size];
#else
		NSFontManager* fm = [NSFontManager sharedFontManager];
		NSFont* newFont = [fm convertFont:[self font] toSize:size];
#endif TARGET_OS_IPHONE
		[self setFont:newFont];
		[[self undoManager] setActionName:NSLocalizedString(@"Font Size", @"undo string for font size change")];
	}
}


- (CGFloat)				fontSize
{
	return [[self font] pointSize];
}


//- (void)				setTextColour:(NSColor*) aColour
- (void)				setTextColour:(DKColor*) aColour
{
	if( ![self locked])
	{
#if TARGET_OS_IPHONE
      (void)aColour;
      twlog("implement setTextColour");
#else
		[self changeTextAttribute:NSForegroundColorAttributeName toValue:aColour];
#endif TARGET_OS_IPHONE
		[[self undoManager] setActionName:NSLocalizedString(@"Text Colour", @"undo string for text colour change")];
	}
}


//- (NSColor*)			textColour
- (DKColor*)			textColour
{
#if TARGET_OS_IPHONE
   twlog("implement textColour");
   return nil;
#else
	return [[self textAttributes] objectForKey:NSForegroundColorAttributeName];
#endif TARGET_OS_IPHONE
}


#pragma mark -
- (void)				setUnderlined:(NSInteger) uval
{
	if(![self locked])
	{
#if TARGET_OS_IPHONE
      (void)uval;
      twlog("implement setUnderlined");
#else
		[self changeTextAttribute:NSUnderlineStyleAttributeName  toValue:[NSNumber numberWithInteger:uval]];
#endif TARGET_OS_IPHONE
		[[self undoManager] setActionName:NSLocalizedString(@"Underline", @"undo string for underline text")];
	}
}


- (NSInteger)					underlined
{
#if TARGET_OS_IPHONE
   twlog("implement underlined");
   return 0;
#else
	return [[[self textAttributes] objectForKey:NSUnderlineStyleAttributeName] integerValue];
#endif TARGET_OS_IPHONE
}


- (void)				toggleUnderlined
{
	if ([self underlined] == 0 )
		[self setUnderlined:1];
	else
		[self setUnderlined:0];
}


#pragma mark -
- (void)				applyToText:(NSMutableAttributedString*) text
{
	NSRange rng = NSMakeRange( 0, [text length]);
	
	//LogEvent_(kReactiveEvent, @"applying text style; text = '%@'",[text string]);
	
	[text setAttributes:[self textAttributes] range:rng];
#ifndef TARGET_OS_IPHONE
	[text fixAttributesInRange:rng];
#endif TARGET_OS_IPHONE
}


- (void)				adoptFromText:(NSAttributedString*) text
{
	// sets the style's text attributes to match those of the attributed string passed
	
	if(![self locked])
	{
		NSDictionary* ta = [text attributesAtIndex:0 effectiveRange:NULL];
		[self setTextAttributes:ta];
	}
}


#pragma mark -
- (DKStyle*)			drawingStyleFromTextAttributes
{
#if TARGET_OS_IPHONE
   twlog("implement drawingStyleFromTextAttributes");
   return nil;
#else
	// returns a drawing style whose fill colour and shadow are set from the text atrributes of the receiver.
	// This is useful when converting text to a path or shape, since the appearance of the result is then consistent.
	
	DKStyle*		styl = [[DKStyle alloc] init];
	DKFill*			fill;
	//NSColor*		fc = [[self textAttributes] objectForKey:NSForegroundColorAttributeName];
	DKColor*		fc = [[self textAttributes] objectForKey:NSForegroundColorAttributeName];
	
	if ( fc )
		fill = [DKFill fillWithColour:fc];
	else
		//fill = [DKFill fillWithColour:[NSColor blackColor]];
		fill = [DKFill fillWithColour:[DKColor blackColor]];
		
	//NSShadow*		shad = [[[self textAttributes] objectForKey:NSShadowAttributeName] copy];
	DKShadow*		shad = [[[self textAttributes] objectForKey:NSShadowAttributeName] copy];

	if ( shad )
	{
		NSSize offset = [shad shadowOffset];
		offset.height = -offset.height;
		[shad setShadowOffset:offset];
		
		[fill setShadow:shad];
		[shad release];
	}
	[styl addRenderer:fill];
	
	// see if there are any stroke attributes:
	
	CGFloat sw = [[[self textAttributes] objectForKey:NSStrokeWidthAttributeName] doubleValue];
	
	if ( sw > 0.0 )
	{
		DKStroke*	stroke = [DKStroke strokeWithWidth:sw colour:[[self textAttributes] objectForKey:NSStrokeColorAttributeName]];
		[styl addRenderer:stroke];
	}

	return [styl autorelease];
#endif TARGET_OS_IPHONE
}


@end
