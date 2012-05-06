//
//  main.m
//  NSString+TextAndNumberValidation
//
//  Created by Tomasz Kuźma on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+TextAndNumberValidation.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {    
        
        NSString *PESEL   = @"44051401458";
        BOOL isValidPESEL = [PESEL isValidPESEL];

        NSString *email   = @"example@example.com";
        BOOL isValidEmail = [email isValidEmailAddress];
        
        NSString *NIP     = @"768-000-24-66";
        BOOL isValidNIP   = [NIP isValidNIP];
        
        NSString *REGON   = @"732065814";
        BOOL isValidREGON = [REGON isValidREGON];
        
        
        NSLog(@"PESEL (%@) is valid: %d",PESEL, isValidPESEL);
        NSLog(@"Email (%@) is valid: %d",email, isValidEmail);        
        NSLog(@"NIP   (%@) is valid: %d",NIP, isValidNIP);
        NSLog(@"REGON (%@) is valid: %d",REGON, isValidREGON);
        
    }
    
    return 0;
}

