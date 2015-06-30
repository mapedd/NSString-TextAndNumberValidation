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
    
    regon       = [[NSString alloc] initWithFormat:@"732065814"];
    pesel       = [[NSString alloc] initWithFormat:@"44051401458"];
    nip         = [[NSString alloc] initWithFormat:@"768-000-24-66"];
    email       = [[NSString alloc] initWithFormat:@"example@example.com"];
    luhn        = [[NSString alloc] initWithFormat:@"5490 1234 5678 9128"];
    iban        = [[NSString alloc] initWithFormat:@"27 1140 2004 0000 3002 0135 5387"];
    telephone   = [[NSString alloc] initWithFormat:@"+48 512 245 987"];
    zipCode     = [[NSString alloc] initWithFormat:@"08-450"];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testZipCode{
    XCTAssertTrue([zipCode isValidPostalCode], @"zip code doesn't pass test");
}

- (void)testPESEL
{
    XCTAssertTrue([pesel isValidPESEL], @"isValidPesel doesn't pass");
}

- (void)testNIP
{
    XCTAssertTrue([nip isValidNIP], @"isValidNIP doesn't pass");    
}

- (void)testREGON
{
    XCTAssertTrue([regon isValidREGON], @"isValidRegon doesn't pass");
}

- (void)testEmail
{
    XCTAssertTrue([email isValidEmailAddress], @"isValidEmailAddress doesn't pass");
}

- (void)testLuhn
{
    XCTAssertTrue([luhn isValidLuhnNumber], @"isValidLuhnNumber doesn't pass");
}

- (void)testIban
{
    XCTAssertTrue([iban isValidIBANNumber], @"isValidIBANNumber doesn't pass");
}

- (void)testTelephone{
    XCTAssertTrue([telephone isValidTelephoneNumber], @"isValidTelephoneNumber doesn't pass");
}

@end
