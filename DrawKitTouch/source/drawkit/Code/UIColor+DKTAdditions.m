///**********************************************************************************************************************************
///  UIColor+DKTAdditions.m
///  DrawKit ©2005-2008 Apptree.net
///
///  UIColor-based analogue to NSColor+DKAdditions by Alex Curylo
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************

#import "UIColor+DKTAdditions.h"

#import "LogEvent.h"


@implementation UIColor (DKTAdditions)
#pragma mark As an UIColor
///*********************************************************************************************************************
///
/// method:			rgbWhite
/// scope:			public class method
/// overrides:		
/// description:	returns the colour white as an RGB Color
/// 
/// parameters:		none
/// result:			the colour white
///
/// notes:			uses the RGB Color space, not the greyscale Colorspace you get with UIColor's whiteColor
///					method.
///
///********************************************************************************************************************

+ (UIColor*)			rgbWhite
{
	return [self rgbGrey:1.0];
}


///*********************************************************************************************************************
///
/// method:			rgbBlack
/// scope:			public class method
/// overrides:		
/// description:	returns the colour black as an RGB Color
/// 
/// parameters:		none
/// result:			the colour black
///
/// notes:			uses the RGB Color space, not the greyscale Colorspace you get with UIColor's blackColor
///					method.
///
///********************************************************************************************************************

+ (UIColor*)			rgbBlack
{
	return [self rgbGrey:0.0];
}


///*********************************************************************************************************************
///
/// method:			rgbGrey:
/// scope:			public class method
/// overrides:		
/// description:	returns a grey RGB colour
/// 
/// parameters:		<grayscale> 0 to 1.0
/// result:			a grey colour
///
/// notes:			uses the RGB Color space, not the greyscale Colorspace you get with UIColor's grey
///					method. 
///
///********************************************************************************************************************

+ (UIColor*)			rgbGrey:(CGFloat) grayscale
{
	return [self rgbGrey:grayscale withAlpha:1.0];
}


///*********************************************************************************************************************
///
/// method:			rgbGrey:withAlpha:
/// scope:			public class method
/// overrides:		
/// description:	returns a grey RGB colour
/// 
/// parameters:		<grayscale> 0 to 1.0
///					<alpha> 0 to 1.0
/// result:			a grey colour with variable opacity
///
/// notes:			uses the RGB Color space, not the greyscale Colorspace you get with UIColor's grey
///					method.
///
///********************************************************************************************************************

+ (UIColor*)			rgbGrey:(CGFloat) grayscale withAlpha:(CGFloat) alpha
{
	return [self colorWithCalibratedRed:grayscale green:grayscale blue:grayscale alpha:alpha];
}


///*********************************************************************************************************************
///
/// method:			rgbGreyWithLuminosityFrom:withAlpha:
/// scope:			public class method
/// overrides:		
/// description:	returns a grey RGB colour with the same perceived brightness as the source colour
/// 
/// parameters:		<colour> any colour
///					<alpha> 0 to 1.0
/// result:			a grey colour in rgb space of equivalent luminosity
///
/// notes:			
///
///********************************************************************************************************************

+ (UIColor*)			rgbGreyWithLuminosityFrom:(UIColor*) colour withAlpha:(CGFloat) alpha
{
	return [self rgbGrey:[colour luminosity] withAlpha:alpha];
}


///*********************************************************************************************************************
///
/// method:			veryLightGrey
/// scope:			public class method
/// overrides:		
/// description:	a very light grey colour
/// 
/// parameters:		none
/// result:			a very light grey colour in rgb space
///
/// notes:			
///
///********************************************************************************************************************

+ (UIColor*)			veryLightGrey
{
	return [self rgbGrey:0.9];
}

#pragma mark -
///*********************************************************************************************************************
///
/// method:			contrastingColor
/// scope:			public class method
/// overrides:		
/// description:	returns black or white depending on input colour - dark colours give white, else black.
/// 
/// parameters:		none
/// result:			black or white
///
/// notes:			colour returned is in grayscale colour space
///
///********************************************************************************************************************

+ (UIColor*)			contrastingColor:(UIColor*) Color
{
	if ([Color luminosity] >= 0.5 )
		return [UIColor blackColor];
	else
		return [UIColor whiteColor];
}


///*********************************************************************************************************************
///
/// method:			colorWithWavelength:
/// scope:			public class method
/// overrides:		
/// description:	returns an RGB colour approximating the wavelength.
/// 
/// parameters:		<lambda> the wavelength in nanometres
/// result:			approximate rgb equivalent colour
///
/// notes:			lambda range outside 380 to 780 (nm) returns black
///
///********************************************************************************************************************

+ (UIColor*)			colorWithWavelength:(CGFloat) lambda
{
	CGFloat   gama = 0.8;
	NSInteger		wave;
	double  red = 0.0;
	double  green = 0.0;
	double  blue = 0.0;
	double  factor;
	
	wave = _CGFloatTrunc(lambda);
	
	if ( wave < 380 || wave > 780 )
		return [UIColor blackColor];
		
	if ( wave >= 380 && wave < 440 )
	{
		red = -(lambda - 440.0f)/(440.0f - 380.0f);
		green = 0.0;
		blue = 1.0;
	}
	else if ( wave >= 440 && wave < 490 )
	{
		red = 0.0;
		green = (lambda - 440.0f)/(490.0f - 440.0f);
		blue = 1.0;
	}
	else if ( wave > 490 && wave < 510 )
	{
		red = 0.0;
		green = 1.0;
		blue = -(lambda - 510.0f)/(510.0f - 490.0f);
	}
	else if ( wave >= 510 && wave < 580 )
	{
		red = (lambda - 510.0f)/(580.0f - 510.0f);
		green = 1.0;
		blue = 0.0;
	}
	else if ( wave >= 580 && wave < 645 )
	{
		red = 1.0;
		green = -(lambda - 645.0f)/(645.0f - 580.0f);
		blue = 0.0;
	}
	else if ( wave >= 645 && wave <= 780 )
	{
		red = 1.0;
		green = 0.0;
		blue = 0.0;
	}
	// Let the intensity fall off near the vision limits
 
	if ( wave >= 380 && wave < 420 )
		factor = 0.3 + 0.7 * (lambda - 380.0f) / (420.0f - 380.0f);
	else if ( wave >= 420 && wave < 700 )
		factor = 1.0;
	else if ( wave >= 700 && wave <= 780 )
		factor = 0.3 + 0.7 * (780.0f - lambda) / (780.0f - 700.0f);
	else
		factor = 0.0;
		
	// adjust rgb for gamma and factor:
	
	red		= powf( red * factor, gama );
	green   = powf( green * factor, gama );
	blue	= powf( blue * factor, gama );
	
	LogEvent_(kInfoEvent, @"red: %f, green: %f, blue: %f", red, green, blue );

	return [UIColor colorWithCalibratedRed:red green:green blue:blue alpha:1.0];
}


///*********************************************************************************************************************
///
/// method:			colorWithHexString:
/// scope:			public class method
/// overrides:		
/// description:	returns an RGB colour corresponding to the standard-formatted HTML hexadecimal colour string.
/// 
/// parameters:		<hex> a string formatted '#RRGGBB'
/// result:			rgb equivalent colour
///
/// notes:			
///
///********************************************************************************************************************

+ (UIColor*)			colorWithHexString:(NSString*) hex
{
	if( hex == nil || [hex length] < 7 )
		return nil;
	
	CGFloat		rgb[3] = { 0 };
	const char* p = [[hex lowercaseString] cStringUsingEncoding:NSUTF8StringEncoding];
	UIColor*	c = nil;
	NSInteger	h, k = 0;
	char		v;
	
	if (*p++ == '#' && [hex length] >= 7 )
	{
		while( k < 3 && *p != 0 )
		{
			v = *p++;
			if ( v > '9' )
				h = (NSInteger)((v - 'a') + 10) * 16;
			else
				h = (NSInteger)v * 16;
				
			v = *p++;
			if ( v > '9' )
				h += (NSInteger)(v - 'a') + 10;
			else
				h += (NSInteger)v;
			
			rgb[k++] = (CGFloat)h / 255.0f;
		}
	
		c = [UIColor colorWithCalibratedRed:rgb[0] green:rgb[1] blue:rgb[2] alpha:1.0];
	}
	
	return c;
}


///*********************************************************************************************************************
///
/// method:			colorByInterpolatingFrom:to:atValue:
/// scope:			public class method
/// overrides:		
/// description:	returns a colour by interpolating between two colours
/// 
/// parameters:		<startColor> a colour
///					<endColor> a second colour
///					<interpValue> a value between 0 and 1
/// result:			a colour that is intermediate between startColor and endColor, in RGB space
///
/// notes:			
///
///********************************************************************************************************************

+ (UIColor*)			colorByInterpolatingFrom:(UIColor*) startColor to:(UIColor*) endColor atValue:(CGFloat) interpValue
{
	// returns an RGB color that interpolates between <start> and <end> given a value from 0..1.
	
	//UIColor* rgb1 = [startColor colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	//UIColor* rgb2 = [endColor colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	UIColor* rgb1 = [startColor colorUsingCalibratedRGBColorSpace];
	UIColor* rgb2 = [endColor colorUsingCalibratedRGBColorSpace];
	
	if( interpValue <= 0.0 )
		return rgb1;
	else if ( interpValue >= 1.0 )
		return rgb2;
	else
	{
		CGFloat r, g, b, a;
		
		r = ([rgb2 redComponent] * interpValue) + ([rgb1 redComponent] * (1.0 - interpValue));
		g = ([rgb2 greenComponent] * interpValue) + ([rgb1 greenComponent] * (1.0 - interpValue));
		b = ([rgb2 blueComponent] * interpValue) + ([rgb1 blueComponent] * (1.0 - interpValue));
		a = ([rgb2 alphaComponent] * interpValue) + ([rgb1 alphaComponent] * (1.0 - interpValue));
		
		return [UIColor colorWithCalibratedRed:r green:g blue:b alpha:a];
	}
}


#pragma mark -
///*********************************************************************************************************************
///
/// method:			colorWithHueFrom:
/// scope:			public instance method
/// overrides:		
/// description:	returns a copy ofthe receiver but substituting the hue from the given colour.
/// 
/// parameters:		<color> donates hue
/// result:			a colour with the hue of <color> but the receiver's saturation and brightness
///
/// notes:			if the receiver is black or white or otherwise fully unsaturated, colourization may not produce visible
///					results. Input colours must be in RGB colour space
///
///********************************************************************************************************************

- (UIColor*)			colorWithHueFrom:(UIColor*) color
{
	return [UIColor colorWithCalibratedHue:[color hueComponent] saturation:[self saturationComponent] brightness:[self brightnessComponent] alpha:[self alphaComponent]];
}


///*********************************************************************************************************************
///
/// method:			colorWithHueAndSaturationFrom:
/// scope:			public instance method
/// overrides:		
/// description:	returns a copy ofthe receiver but substituting the hue and saturation from the given colour.
/// 
/// parameters:		<color> donates hue and saturation
/// result:			a colour with the hue, sat of <color> but the receiver's brightness
///
/// notes:			Input colours must be in RGB colour space
///
///********************************************************************************************************************

- (UIColor*)			colorWithHueAndSaturationFrom:(UIColor*) color
{
	return [UIColor colorWithCalibratedHue:[color hueComponent] saturation:[color saturationComponent] brightness:[self brightnessComponent] alpha:[self alphaComponent]];
}


///*********************************************************************************************************************
///
/// method:			colorWithRGBAverageFrom:
/// scope:			public instance method
/// overrides:		
/// description:	returns a colour by averaging the receiver with <color> in rgb space
/// 
/// parameters:		<color> average with this colour
/// result:			average of the two colours
///
/// notes:			Input colours must be in RGB colour space
///
///********************************************************************************************************************

- (UIColor*)			colorWithRGBAverageFrom:(UIColor*) color
{
	CGFloat ba[4] = {0.5, 0.5, 0.5, 0.5};
	
	return [self colorWithRGBBlendFrom:color blendingAmounts:ba];
}


///*********************************************************************************************************************
///
/// method:			colorWithHSBAverageFrom:
/// scope:			public instance method
/// overrides:		
/// description:	returns a colour by averaging the receiver with <color> in hsb space
/// 
/// parameters:		<color> average with this colour
/// result:			average of the two colours
///
/// notes:			Input colours must be in RGB colour space
///
///********************************************************************************************************************

- (UIColor*)			colorWithHSBAverageFrom:(UIColor*) color
{
	CGFloat ba[4] = {0.5, 0.5, 0.5, 0.5};
	
	return [self colorWithHSBBlendFrom:color blendingAmounts:ba];
}


#pragma mark -
///*********************************************************************************************************************
///
/// method:			colorWithRGBBlendFrom:blendingAmounts:
/// scope:			public instance method
/// overrides:		
/// description:	returns a colour by blending the receiver with <color> in rgb space
/// 
/// parameters:		<color> blend with this colour
///					<blendingAmounts> an array of four values, each 0..1, specifies how components from each colour are
///					blended
/// result:			blend of the two colours
///
/// notes:			
///
///********************************************************************************************************************

- (UIColor*)			colorWithRGBBlendFrom:(UIColor*) color blendingAmounts:(CGFloat[]) blends
{
	//UIColor* sc = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	//UIColor* dc = [color colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	UIColor* sc = [self colorUsingCalibratedRGBColorSpace];
	UIColor* dc = [color colorUsingCalibratedRGBColorSpace];
	
	CGFloat r, g, b, a;
	
	r = ([sc redComponent] * ( 1.0 - blends[0])) + ([dc redComponent] * blends[0]);
	g = ([sc greenComponent] * ( 1.0 - blends[1])) + ([dc greenComponent] * blends[1]);
	b = ([sc blueComponent] * ( 1.0 - blends[2])) + ([dc blueComponent] * blends[2]);
	a = ([sc alphaComponent] * ( 1.0 - blends[3])) + ([dc alphaComponent] * blends[3]);
	
	return [UIColor colorWithCalibratedRed:r green:g blue:b alpha:a];
}


///*********************************************************************************************************************
///
/// method:			colorWithHSBBlendFrom:blendingAmounts:
/// scope:			public instance method
/// overrides:		
/// description:	returns a colour by blending the receiver with <color> in hsb space
/// 
/// parameters:		<color> blend with this colour
///					<blendingAmounts> an array of four values, each 0..1, specifies how components from each colour are
///					blended
/// result:			blend of the two colours
///
/// notes:			
///
///********************************************************************************************************************

- (UIColor*)			colorWithHSBBlendFrom:(UIColor*) color blendingAmounts:(CGFloat[]) blends
{
	//UIColor* sc = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	//UIColor* dc = [color colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	UIColor* sc = [self colorUsingCalibratedRGBColorSpace];
	UIColor* dc = [color colorUsingCalibratedRGBColorSpace];

	CGFloat h, s, b, a;
	
	h = ([sc hueComponent] * ( 1.0 - blends[0])) + ([dc hueComponent] * blends[0]);
	s = ([sc saturationComponent] * ( 1.0 - blends[1])) + ([dc saturationComponent] * blends[1]);
	b = ([sc brightnessComponent] * ( 1.0 - blends[2])) + ([dc brightnessComponent] * blends[2]);
	a = ([sc alphaComponent] * ( 1.0 - blends[3])) + ([dc alphaComponent] * blends[3]);
	
	return [UIColor colorWithCalibratedHue:h saturation:s brightness:b alpha:a];
}


#pragma mark -
///*********************************************************************************************************************
///
/// method:			luminosity
/// scope:			public instance method
/// overrides:		
/// description:	returns the luminosity value of the receiver
/// 
/// parameters:		none
/// result:			a value 0..1 that is the colour's luminosity
///
/// notes:			luminosity of a colour is both subjective and dependent on the display characteristics of particular
///					monitors, etc. A frequently used formula can be traced to experiments done by the NTSC television
///					standards committee in 1953, which was based on tube phosphors in common use at that time. A more
///					modern formula is applicable for LCD monitors. This method uses the NTSC formula if
///					NTSC_1953_STANDARD is defined, otherwise the modern one.
///
///********************************************************************************************************************

- (CGFloat)				luminosity
{
	//UIColor* rgb = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	UIColor* rgb = [self colorUsingCalibratedRGBColorSpace];

#ifdef NTSC_1953_STANDARD
	return [rgb redComponent] * 0.299 + [rgb greenComponent] * 0.587 + [rgb blueComponent] * 0.114;
#else
	return [rgb redComponent] * 0.212671 + [rgb greenComponent] * 0.715160 + [rgb blueComponent] * 0.072169;
#endif
}


///*********************************************************************************************************************
///
/// method:			colorWithLuminosity:
/// scope:			public instance method
/// overrides:		
/// description:	returns a grey rgb colour having the same luminosity as the receiver
/// 
/// parameters:		none
/// result:			a grey colour having the same luminosity
///
/// notes:			
///
///********************************************************************************************************************

- (UIColor*)			colorWithLuminosity
{
	return [UIColor rgbGrey:[self luminosity]];
}


///*********************************************************************************************************************
///
/// method:			contrastingColor
/// scope:			public instance method
/// overrides:		
/// description:	returns black or white to give best contrast with the receiver's colour
/// 
/// parameters:		none
/// result:			black or white
///
/// notes:			
///
///********************************************************************************************************************

- (UIColor*)			contrastingColor
{
	return [UIColor contrastingColor:self];
}


///*********************************************************************************************************************
///
/// method:			invertedColor
/// scope:			public instance method
/// overrides:		
/// description:	returns the colour with each colour component subtracted from 1
/// 
/// parameters:		none
/// result:			the "inverse" of the receiver
///
/// notes:			the alpha value is not inverted
///
///********************************************************************************************************************

- (UIColor*)			invertedColor
{
	//UIColor* rgb = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	UIColor* rgb = [self colorUsingCalibratedRGBColorSpace];
	
	CGFloat r, g, b;
	
	r = 1.0 - [rgb redComponent];
	g = 1.0 - [rgb greenComponent];
	b = 1.0 - [rgb blueComponent];
	
	return [UIColor colorWithCalibratedRed:r green:g blue:b alpha:[rgb alphaComponent]];
}


///*********************************************************************************************************************
///
/// method:			lighterColorWithLevel:
/// scope:			public instance method
/// overrides:		
/// description:	returns a lighter colour based on a blend between the receiver and white
/// 
/// parameters:		<amount> a value 0.0..1.0, 0 returns the original colour, 1 returns white.
/// result:			a lightened version of the receiver
///
/// notes:			the alpha value is unchanged
///
///********************************************************************************************************************

- (UIColor*)			lighterColorWithLevel:(CGFloat) amount
{
	//UIColor* rgb = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	UIColor* rgb = [self colorUsingCalibratedRGBColorSpace];
	CGFloat	 bl[4];
	
	bl[0] = bl[1] = bl[2] = amount;
	bl[3] = 0.0;
	
	return [rgb colorWithRGBBlendFrom:[UIColor rgbWhite] blendingAmounts:bl]; 
}


///*********************************************************************************************************************
///
/// method:			darkerColorWithLevel:
/// scope:			public instance method
/// overrides:		
/// description:	returns a darker colour based on a blend between the receiver and black
/// 
/// parameters:		<amount> a value 0.0..1.0, 0 returns the original colour, 1 returns black.
/// result:			a darkened version of the receiver
///
/// notes:			the alpha value is unchanged
///
///********************************************************************************************************************

- (UIColor*)			darkerColorWithLevel:(CGFloat) amount
{
	//UIColor* rgb = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	UIColor* rgb = [self colorUsingCalibratedRGBColorSpace];
	CGFloat	 bl[4];
	
	bl[0] = bl[1] = bl[2] = amount;
	bl[3] = 0.0;
	
	return [rgb colorWithRGBBlendFrom:[UIColor rgbBlack] blendingAmounts:bl]; 
}


///*********************************************************************************************************************
///
/// method:			interpolatedColorToColor:atValue:
/// scope:			public instance method
/// overrides:		
/// description:	returns a colour by interpolating between the receiver and a second colour
/// 
/// parameters:		<secondColour> another colour
///					<interpValue> a value between 0 and 1
/// result:			a colour that is intermediate between the receiver and secondColor, in RGB space
///
/// notes:			
///
///********************************************************************************************************************

- (UIColor*)			interpolatedColorToColor:(UIColor*) secondColor atValue:(CGFloat) interpValue;
{
	return [UIColor colorByInterpolatingFrom:self to:secondColor atValue:interpValue];
}


#pragma mark -
///*********************************************************************************************************************
///
/// method:			hexString
/// scope:			public instance method
/// overrides:		
/// description:	returns a standard web-formatted hexadecimal representation of the receiver's colour
/// 
/// parameters:		none
/// result:			hexadecimal string
///
/// notes:			format is '#000000' (black) to '#FFFFFF' (white)
///
///********************************************************************************************************************

- (NSString*)			hexString
{
	//UIColor* rgb = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
	
	CGFloat	r, g, b; //, a;
	NSInteger		hr, hb, hg;
	
	//[rgb getRed:&r green:&g blue:&b alpha:&a];
   const CGFloat *components = CGColorGetComponents(self.CGColor);
	size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
   twcheck(2 == numComponents || 4 == numComponents);
   r = components[0];
   g = (4 == numComponents) ? components[1] : components[0];
   b = (4 == numComponents) ? components[2] : components[0];
   //a = CGColorGetAlpha(self.CGColor);
	
	//hr = (NSInteger) floor( r * 255.0f );
	//hg = (NSInteger) floor( g * 255.0f );
	//hb = (NSInteger) floor( b * 255.0f );
	// we'll remove casts to quiet our compiler warnings ...alex
   hr = floorf( r * 255.0f );
	hg = floorf( g * 255.0f );
	hb = floorf( b * 255.0f );
	
	NSString* s = [NSString stringWithFormat:@"#%02X%02X%02X", hr, hg, hb ];

	return s;
}


#pragma mark -
///*********************************************************************************************************************
///
/// method:			quartzColor
/// scope:			public instance method
/// overrides:		
/// description:	returns a quartz CGColorRef corresponding to the receiver's colours
/// 
/// parameters:		none
/// result:			CGColorRef
///
/// notes:			returned colour uses the generic RGB colour space, regardless of the receivers colourspace. Caller
///					is responsible for releasing the colour ref when done.
///
///********************************************************************************************************************

- (CGColorRef)			newQuartzColor
{
    /*
     UIColor* deviceColor = [self colorUsingColorSpaceName:NSDeviceRGBColorSpace];
   
    CGFloat components[4];
	
	[deviceColor getRed:&components[0] green:&components[1] blue:&components[2] alpha:&components[3]];
    */
   const CGFloat *components = CGColorGetComponents(self.CGColor);
  
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef cgColor = CGColorCreate(colorSpace, components);
    CGColorSpaceRelease(colorSpace);

    return cgColor;
}


#pragma mark -
#pragma mark NSColor emulations

- (NSInteger)numberOfComponents
{
	size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
   return numComponents;
}

- (void)getComponents:(CGFloat *)components
{
   const CGFloat *theComponents = CGColorGetComponents(self.CGColor);
	size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
   memcpy(components, theComponents, numComponents * sizeof(CGFloat));
}

- (void)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha
{
   *alpha = CGColorGetAlpha(self.CGColor);
   const CGFloat *components = CGColorGetComponents(self.CGColor);
	size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
   switch (numComponents)
   {
      case 4:
         *red = components[0];
         *green = components[1];
         *blue = components[2];
         break;
      case 2:
         *red = *green = *blue = components[0];
      default:
         twlog("what kind of color has %d components?", numComponents);
         *red = *green = *blue = 0;
         break;
   }
}

- (void)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha
{
   *alpha = CGColorGetAlpha(self.CGColor);
   *hue = self.hueComponent;
   *saturation = self.saturationComponent;
   *brightness = self.brightnessComponent;
}

- (CGFloat)redComponent
{
   const CGFloat *components = CGColorGetComponents(self.CGColor);
#if DEBUG
	size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
   twcheck(2 == numComponents || 4 == numComponents);
#endif DEBUG
   return components[0];
}

- (CGFloat)greenComponent
{
   const CGFloat *components = CGColorGetComponents(self.CGColor);
	size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
   twcheck(2 == numComponents || 4 == numComponents);
   return (4 == numComponents) ? components[1] : components[0];
}

- (CGFloat)blueComponent
{
   const CGFloat *components = CGColorGetComponents(self.CGColor);
	size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
   twcheck(2 == numComponents || 4 == numComponents);
   return (4 == numComponents) ? components[2] : components[0];
}

- (CGFloat)alphaComponent
{
   return CGColorGetAlpha(self.CGColor);
}

// lifted from
// http://code.google.com/p/touchcode/source/browse/TouchUI/iPhone/Extensions/UIColor_Blending.m?spec=svn8e47e169048b1e8f15ab787bb7f93ee32d0c2b7e&r=8e47e169048b1e8f15ab787bb7f93ee32d0c2b7e

- (CGFloat)hueComponent
{
   CGFloat red = [self redComponent];
   CGFloat green = [self greenComponent];
   CGFloat blue = [self blueComponent];
   
   CGFloat max = MAX( red, MAX( green, blue ) );
   CGFloat min = MIN( red, MIN( green, blue ) );
   
   CGFloat hue = 0;
   
   if ( max == min ) {
      hue = 0.0f;
   }
   
   else if ( max == red ) {
      hue = ( 60.0f * ( ( green - blue ) / ( max - min ) ) );
      hue = (CGFloat)fmod( hue, 360.0f);
   }
   
   else if ( max == green ) {
      hue = ( 60.0f * ( ( blue - red ) / ( max - min ) ) + 120.0f );
   }
   
   else if ( max == blue ) {
      hue = ( 60.0f * ( ( red - green ) / ( max - min ) ) + 240.0f );
   }
   
   return hue / 360.0f;
}

- (CGFloat)saturationComponent
{
   CGFloat red = [self redComponent];
   CGFloat green = [self greenComponent];
   CGFloat blue = [self blueComponent];
   
   CGFloat max = MAX( red, MAX( green, blue ) );
   CGFloat min = MIN( red, MIN( green, blue ) );    
   
   if ( max == min ) {
      return 0;
   }
   
   CGFloat brightness = [self brightnessComponent];
   
   if ( brightness <= 0.5f ) {
      return ( max - min ) / ( max + min );
   }
   else {
      return ( max - min ) / ( 2.0f - ( max + min ) );
   }
}

- (CGFloat)brightnessComponent
{
   CGFloat red = [self redComponent];
   CGFloat green = [self greenComponent];
   CGFloat blue = [self blueComponent];
   
   CGFloat max = MAX( red, MAX( green, blue ) );
   CGFloat min = MIN( red, MIN( green, blue ) );    
   
   if ( max == 0 ) {
      return 0.0f;
   }
   
   return ( 1.0f - ( min / max ) );
}

+ (UIColor *)colorWithCalibratedWhite:(CGFloat)white alpha:(CGFloat)alpha
{
   // perhaps use CGColorCreate?
   return [UIColor colorWithWhite:white alpha:alpha];
}

+ (UIColor *)colorWithDeviceRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
   // perhaps use CGColorCreate?
   return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithCalibratedRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
   // perhaps use CGColorCreate?
   return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithCalibratedHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha
{
   // perhaps use CGColorCreate?
   return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

/*
- (UIColor *)colorUsingColorSpaceName:(NSString *)colorSpace
{
   // perhaps use CGColorCreate? Check blog post on greyscaling?
   twlog("colorUsingColorSpaceName: %@", colorSpace);
   return [self copy];
}
*/

- (UIColor *)colorUsingCalibratedRGBColorSpace
{
   // perhaps use CGColorCreate?
   return [[self copy] autorelease];
}

- (void)drawSwatchInRect:(CGRect)rect
{
   [self set];
   UIRectFill(rect);
}

+ (UIColor *)selectedTextBackgroundColor
{
   // is this actually specified/available anywhere?
   return [UIColor blueColor];
}

@end


