//
//  TextAndNumberValidation_test.m
//  TextAndNumberValidation_test
//
//  Created by Tomasz Kuźma on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TextAndNumberValidation_test.h"

#import "NSString+TextAndNumberValidation.h"

@implementation TextAndNumberValidation_test

- (void)setUp
{
    [super setUp];
    
    regon   = [[NSString alloc] initWithFormat:@"732065814"];
    pesel   = [[NSString alloc] initWithFormat:@"44051401458"];
    nip     = [[NSString alloc] initWithFormat:@"768-000-24-66"];
    email   = [[NSString alloc] initWithFormat:@"example@example.com"];
    luhn    = [[NSString alloc] initWithFormat:@"5490 1234 5678 9128"];
    iban    = [[NSString alloc] initWithFormat:@"27 1140 2004 0000 3002 0135 5387"];
}

- (void)tearDown
{
    [regon release];
    [pesel release];
    [nip release];
    [email release];
    [luhn release];
    [iban release];
    
    [super tearDown];
}

- (void)testPESEL
{
    STAssertTrue([pesel isValidPESEL], @"isValidPesel doesn't pass");
}

- (void)testNIP
{
    STAssertTrue([nip isValidNIP], @"isValidNIP doesn't pass");    
}

- (void)testREGON
{
    STAssertTrue([regon isValidREGON], @"isValidRegon doesn't pass");
}

- (void)testEmail
{
    STAssertTrue([email isValidEmailAddress], @"isValidEmailAddress doesn't pass");
}

- (void)testLuhn
{
    STAssertTrue([luhn isValidLuhnNumber], @"isValidLuhnNumber doesn't pass");
}

- (void)testIban
{
    STAssertTrue([iban isValidIBANNumber], @"isValidIBANNumber doesn't pass");
}

@end
