//
//  DKTextSubstitutor.h
//  GCDrawKit
//
//  Created by graham on 24/04/09.
//  Copyright 2009 Apptree.net. All rights reserved.
//

// not in iPhone SDK, should be left to .pch ...alex
//#import <Cocoa/Cocoa.h>


@interface DKTextSubstitutor : NSObject <NSCoding>
{
	NSAttributedString*	mMasterString;
	NSMutableArray*		mKeys;
	BOOL				mNeedsToEvaluate;
}

+ (NSString*)			delimiterString;
+ (void)				setDelimiterString:(NSString*) delim;
+ (NSCharacterSet*)		keyBreakingCharacterSet;

- (id)					initWithString:(NSString*) aString;
- (id)					initWithAttributedString:(NSAttributedString*) aString;

- (void)				setMasterString:(NSAttributedString*) master;
- (NSAttributedString*)	masterString;

- (void)				setString:(NSString*) aString withAttributes:(NSDictionary*) attrs;
- (NSString*)			string;

- (void)				setAttributes:(NSDictionary*) attrs;
- (NSDictionary*)		attributes;

- (void)				processMasterString;
- (NSArray*)			allKeys;

- (NSAttributedString*)	substitutedStringWithObject:(id) anObject;
- (NSString*)			metadataStringFromObject:(id) object;

@end

extern NSString*		kDKTextSubstitutorNewStringNotification;


#define		DEFAULT_DELIMITER_STRING	@"%%"
#define		PADDING_DELIMITER			'#'

@interface DKTextSubstitutionKey	: NSObject
{
	NSString*			mKey;
	NSRange				mRange;
	NSArray*			mSubKeys;
	unsigned			mPadLength;
	NSString*			mPadCharacter;
}

+ (NSCharacterSet*)	validSubkeysCharacterSet;
+ (NSDictionary*)	abbreviationDictionary;
+ (void)			setAbbreviationDictionary:(NSDictionary*) abbreviations;

- (id)				initWithKey:(NSString*) key range:(NSRange) aRange;

- (NSString*)		key;
- (NSRange)			range;
- (BOOL)			isPropertyKeyPath;
- (NSArray*)		subKeys;
- (NSString*)		stringByApplyingSubkeysToString:(NSString*) inString;

- (void)			setPadding:(unsigned) padLength;
- (unsigned)		padding;
- (void)			setPaddingCharacter:(NSString*) padStr;
- (NSString*)		paddingCharacter;

@end


/*

This objects abstracts the text substitution task used by text adornments, et. al. It allows strings of the form:
 
 "This is fixed text %%sub1 more fixed text %%sub2 and so on..."
 
 Where %%sub1 and %%sub2 (where the word following %% represents a metadata key) are replaced by the metadata value keyed.
 
 A non-property key can also have further flags, called subKeys. These are . delimited single character attributes which invoke specific behaviours. By default these
 are the digits 0-9 which extract the nth word from the original data, and the flags U, L and C which convert the data to upper, lower and capitalized strings respectively.

*/

