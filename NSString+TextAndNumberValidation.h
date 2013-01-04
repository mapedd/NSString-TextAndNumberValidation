//
//  NString+NumberValidation.h
//  
//
//  Created by Tomasz Kuźma on 3/10/12.
//  Copyright (c) 2012 Tomasz Kuźma (mapedd@gmail.com). All rights reserved.
//

#import <Foundation/Foundation.h>

NSRange TKNSRangeMake(NSUInteger location,NSUInteger length);

@interface NSString (TextAndNumberValidation)

- (BOOL)isValidEmailAddress;

- (BOOL)isValidPESEL;

- (BOOL)isValidNIP;

- (BOOL)isValidREGON;

- (BOOL)isValidLuhnNumber;

- (BOOL)isValidIBANNumber; /* Poland */

- (BOOL)isValidIBANNumberForCountry:(NSString *)countryCode;

- (BOOL)isNumeric;

- (BOOL)isValidTelephoneNumber;

- (NSString *)TKNumberFromLetter;

@end
