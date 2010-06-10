///**********************************************************************************************************************************
///  UIColor+DKTAdditions.h
///  DrawKit ©2005-2008 Apptree.net
///
///  UIColor-based analogue to NSColor+DKAdditions by Alex Curylo
///
///	 This software is released subject to licensing conditions as detailed in DRAWKIT-LICENSING.TXT, which must accompany this source file. 
///
///**********************************************************************************************************************************


@interface UIColor (DKTAdditions)

+ (UIColor*)			rgbWhite;
+ (UIColor*)			rgbBlack;
+ (UIColor*)			rgbGrey:(CGFloat) grayscale;
+ (UIColor*)			rgbGrey:(CGFloat) grayscale withAlpha:(CGFloat) alpha;
+ (UIColor*)			rgbGreyWithLuminosityFrom:(UIColor*) colour withAlpha:(CGFloat) alpha;

+ (UIColor*)			veryLightGrey;

+ (UIColor*)			contrastingColor:(UIColor*) color;
+ (UIColor*)			colorWithWavelength:(CGFloat) lambda;
+ (UIColor*)			colorWithHexString:(NSString*) hex;

+ (UIColor*)			colorByInterpolatingFrom:(UIColor*) startColor to:(UIColor*) endColor atValue:(CGFloat) interpValue;

- (UIColor*)			colorWithHueFrom:(UIColor*) color;
- (UIColor*)			colorWithHueAndSaturationFrom:(UIColor*) color;
- (UIColor*)			colorWithRGBAverageFrom:(UIColor*) color;
- (UIColor*)			colorWithHSBAverageFrom:(UIColor*) color;

- (UIColor*)			colorWithRGBBlendFrom:(UIColor*) color blendingAmounts:(CGFloat[]) blends;
- (UIColor*)			colorWithHSBBlendFrom:(UIColor*) color blendingAmounts:(CGFloat[]) blends;

- (CGFloat)				luminosity;
- (UIColor*)			colorWithLuminosity;
- (UIColor*)			contrastingColor;
- (UIColor*)			invertedColor;

- (UIColor*)			lighterColorWithLevel:(CGFloat) amount;
- (UIColor*)			darkerColorWithLevel:(CGFloat) amount;

- (UIColor*)			interpolatedColorToColor:(UIColor*) secondColor atValue:(CGFloat) interpValue;

- (NSString*)			hexString;

- (CGColorRef)			newQuartzColor;

#pragma mark -
#pragma mark NSColor emulations

- (NSInteger)numberOfComponents;
- (void)getComponents:(CGFloat *)components;
- (void)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha;
- (void)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha;
- (CGFloat)redComponent;
- (CGFloat)greenComponent;
- (CGFloat)blueComponent;
- (CGFloat)alphaComponent;
- (CGFloat)hueComponent;
- (CGFloat)saturationComponent;
- (CGFloat)brightnessComponent;

+ (UIColor *)colorWithCalibratedWhite:(CGFloat)white alpha:(CGFloat)alpha;
+ (UIColor *)colorWithDeviceRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithCalibratedRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithCalibratedHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha;
//- (UIColor *)colorUsingColorSpaceName:(NSString *)colorSpace;
- (UIColor *)colorUsingCalibratedRGBColorSpace;

- (void)drawSwatchInRect:(CGRect)rect;

+ (UIColor *)selectedTextBackgroundColor;

@end
