//
//  NString+NumberValidation.m
//  
//
//  Created by Tomasz Kuźma on 3/10/12.
//  Copyright (c) 2012 Tomasz Kuźma (mapedd@gmail.com). All rights reserved.
//

//#define ENABLE_10_IN_NIP_CONTROL_NUMBER

#import "NSString+TextAndNumberValidation.h"

NSInteger DepNo[] = {
    101, 102, 103, 104, 105, 106, 107, 108, 109, 111, 112, 113, 114, 115, 116,
    117, 118, 119, 121, 122, 123, 124, 125, 126, 127, 128, 129, 131, 132, 133,
    134, 135, 136, 137, 138, 139, 141, 142, 143, 144, 145, 146, 147, 148, 149,
    151, 152, 153, 154, 155, 156, 157, 158, 159, 161, 162, 163, 164, 165, 166,
    167, 168, 169, 171, 172, 173, 174, 175, 176, 177, 178, 179, 181, 182, 183,
    184, 185, 186, 187, 188, 189, 191, 192, 193, 194, 195, 196, 197, 198, 199,
    201, 202, 203, 204, 205, 206, 207, 208, 209, 211, 212, 213, 214, 215, 216,
    217, 218, 219, 221, 222, 223, 224, 225, 226, 227, 228, 229, 231, 232, 233,
    234, 235, 236, 237, 238, 239, 241, 242, 243, 244, 245, 246, 247, 248, 249,
    251, 252, 253, 254, 255, 256, 257, 258, 259, 261, 262, 263, 264, 265, 266,
    267, 268, 269, 271, 272, 273, 274, 275, 276, 277, 278, 279, 281, 282, 283,
    284, 285, 286, 287, 288, 289, 291, 292, 293, 294, 295, 296, 297, 298, 301,
    302, 311, 312, 313, 314, 315, 316, 317, 318, 319, 321, 322, 323, 324, 325,
    326, 327, 328, 329, 331, 332, 333, 334, 335, 336, 337, 338, 339, 341, 342,
    343, 344, 345, 346, 347, 348, 349, 351, 352, 353, 354, 355, 356, 357, 358,
    359, 361, 362, 363, 364, 365, 366, 367, 368, 369, 371, 372, 373, 374, 375,
    376, 377, 378, 379, 381, 382, 383, 384, 385, 386, 387, 388, 389, 391, 392,
    393, 394, 395, 396, 397, 398, 399, 411, 412, 413, 414, 415, 416, 417, 418,
    419, 421, 422, 423, 424, 425, 426, 427, 428, 429, 431, 432, 433, 434, 435,
    436, 437, 438, 439, 441, 442, 443, 444, 445, 446, 447, 448, 449, 451, 452,
    453, 454, 455, 456, 457, 458, 459, 461, 462, 463, 464, 465, 466, 467, 468,
    469, 471, 472, 473, 474, 475, 476, 477, 478, 479, 481, 482, 483, 484, 485,
    486, 487, 488, 489, 491, 492, 493, 494, 495, 496, 497, 498, 499, 501, 502,
    503, 504, 505, 506, 507, 508, 509, 511, 512, 513, 514, 516, 519, 521, 522,
    523, 524, 525, 526, 527, 528, 529, 531, 532, 533, 534, 535, 536, 537, 538,
    539, 541, 542, 543, 544, 545, 546, 547, 548, 549, 551, 552, 553, 554, 555,
    556, 557, 558, 559, 561, 562, 563, 564, 565, 566, 567, 568, 569, 571, 572,
    573, 574, 575, 576, 577, 578, 579, 581, 582, 583, 584, 585, 586, 587, 588,
    589, 591, 592, 593, 594, 595, 596, 597, 598, 599, 601, 602, 603, 604, 605,
    606, 607, 608, 609, 611, 612, 613, 614, 615, 616, 617, 618, 619, 621, 622,
    623, 624, 625, 626, 627, 628, 629, 631, 632, 633, 634, 635, 636, 637, 638,
    639, 641, 642, 643, 644, 645, 646, 647, 648, 649, 651, 652, 653, 654, 655,
    656, 657, 658, 659, 661, 662, 663, 664, 665, 666, 667, 668, 669, 671, 672,
    673, 674, 675, 676, 677, 678, 679, 681, 682, 683, 684, 685, 686, 687, 688,
    689, 691, 692, 693, 694, 695, 696, 697, 698, 699, 701, 711, 712, 713, 714,
    715, 716, 717, 718, 719, 721, 722, 723, 724, 725, 726, 727, 728, 729, 731,
    732, 733, 734, 735, 736, 737, 738, 739, 741, 742, 743, 744, 745, 746, 747,
    748, 749, 751, 752, 753, 754, 755, 756, 757, 758, 759, 761, 762, 763, 764,
    765, 766, 767, 768, 769, 771, 772, 773, 774, 775, 776, 777, 778, 779, 781,
    782, 783, 784, 785, 786, 787, 788, 789, 791, 792, 793, 794, 795, 796, 797,
    798, 799, 811, 812, 813, 814, 815, 816, 817, 818, 819, 821, 822, 823, 824,
    825, 826, 827, 828, 829, 831, 832, 833, 834, 835, 836, 837, 838, 839, 841,
    842, 843, 844, 845, 846, 847, 848, 849, 851, 852, 853, 854, 855, 856, 857,
    858, 859, 861, 862, 863, 864, 865, 866, 867, 868, 869, 871, 872, 873, 874,
    875, 876, 877, 878, 879, 881, 882, 883, 884, 885, 886, 887, 888, 889, 891,
    892, 893, 894, 895, 896, 897, 898, 899, 911, 912, 913, 914, 915, 916, 917,
    918, 919, 921, 922, 923, 924, 925, 926, 927, 928, 929, 931, 932, 933, 934,
    935, 936, 937, 938, 939, 941, 942, 943, 944, 945, 946, 947, 948, 949, 951,
    952, 953, 954, 955, 956, 957, 958, 959, 961, 962, 963, 964, 965, 966, 967,
    968, 969, 971, 972, 973, 974, 975, 976, 977, 978, 979, 981, 982, 983, 984,
    985, 986, 987, 988, 989, 991, 992, 993, 994, 995, 996, 997, 998 };



NSInteger PESEL_wights[] = {1, 3, 7, 9, 1, 3, 7, 9, 1, 3};

NSInteger NIP_weights[] = {6, 5, 7, 2, 3, 4, 5, 6, 7};

NSInteger REGON_7_weights[] = {    2, 3, 4, 5, 6, 7};

NSInteger REGON_9_weights[] = {8, 9, 2, 3, 4, 5, 6, 7};

NSInteger REGON_14_weights[] = {2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8};



NSRange TKNSRangeMake(NSUInteger location,NSUInteger length){
    NSRange range;
    
    range.location = location;
    range.length = length;
    
    return range;
}

@implementation  NSString (NumberValidation)

- (BOOL)isValidEmailAddress{
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\b[A-Z0-9._%-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}\\b"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self
                                                        options:0
                                                          range:NSMakeRange(0, [self length])];
    
    
    
    return numberOfMatches ? YES : NO;
}

- (BOOL)isValidPESEL{
    
    if (![self isNumeric]) {
        return NO;
    }
    
    if ([self length] != 11) {
        return NO;
    }
    
    NSInteger table[11];
    
    for (int i=0; i<11 ; i++) {
        NSString *number = [self substringWithRange:TKNSRangeMake(i, 1)];
        table[i] = [number integerValue];
    }
    
    NSInteger validator = 0;
    
    for (int i = 0; i < 10; i++) {
        validator += PESEL_wights[i] * table[i];
    }
    
    NSInteger rest = validator % 10;
    
    
    if (rest == 0 && table[10] == 0) {
        return YES;
    }
    
    if (10 - rest == table[10]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isValidNIP{
    NSString *selfString = [NSString stringWithString:self];
    
    if ([[selfString substringWithRange:TKNSRangeMake(0, 2)] isEqualToString:@"PL"]) {
        //european notation
        selfString  = [selfString substringFromIndex:2];
    }
    
    NSString *spaceless = [selfString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *dashless = [spaceless stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    if (![dashless isNumeric])
        return NO;

    if ([dashless length] != 10)
        return NO;
    

    NSString *prefix = [dashless substringWithRange:TKNSRangeMake(0, 3)];

    NSString *controlNumber= [dashless substringWithRange:TKNSRangeMake(9, 1)];
    
    NSInteger prefixInt = [prefix intValue];
    
    BOOL found = NO;
    for (int i = 1; i < 763; i++) {
        if (prefixInt == DepNo[i]) {
            found = YES;
            break;
        }
    }
    
    if (!found)
        return NO;

    
    NSInteger sum = 0;
    
    for (int i = 0; i < 9; i++) {
        NSInteger number = [[dashless substringWithRange:TKNSRangeMake(i, 1)] integerValue];
        sum += number * NIP_weights[i];
    }
    
    NSInteger rest = sum % 11;
    
#ifdef ENABLE_10_IN_NIP_CONTROL_NUMBER
    if (rest == 10) 
        rest = 0;
    
#else
    if (rest == 10) 
        return NO;
    
#endif
    
    
    return [controlNumber integerValue] == rest;
}

- (BOOL)isValidREGON{
    
    NSInteger length = [self length];
    NSInteger *weights = NULL;
    BOOL motherIsValid = NO;
    
    if (length == 7) {
        weights = REGON_7_weights;
    }
    else if(length == 9){
        weights = REGON_9_weights;
    }
    else if(length == 14){
        weights = REGON_14_weights;
        motherIsValid = [[self substringWithRange:TKNSRangeMake(0, 9)] isValidREGON];
    }
    else{
        return NO;
    }
    
    NSInteger sum = [self sumWithWeights:weights forNumericString:[self substringToIndex:length - 1]];
    
    NSInteger rest = sum % 11;
    
    if (rest == 10) {
        rest = 0;
    }
    
    NSInteger controlNumber = [[self substringFromIndex:length - 1] integerValue];
    
    if (rest == controlNumber){
        if (length == 14){
            if (motherIsValid)
                return YES;
            else 
                return NO;
        }
            
        return YES;
    }
    else 
        return NO;
    
}

- (BOOL)isValidIBANNumber{
    return [self isValidIBANNumberForCountry:@"PL"];
}

- (BOOL)isValidIBANNumberForCountry:(NSString *)countryCode{
    
    if ([self length] < 4) {
        return NO;
    }
    
    NSString *noSpacesStirng = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    noSpacesStirng = [noSpacesStirng stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    if (![noSpacesStirng isNumeric]) {
        return NO;
    }
    
    NSString *IBANString  = [NSString stringWithFormat:@"%@%@",countryCode, noSpacesStirng];
    
    NSString *first4Signs = [IBANString substringToIndex:4];
    NSString *restSigns = [IBANString substringFromIndex:4];
    
    IBANString  = [NSString stringWithFormat:@"%@%@", restSigns, first4Signs];
    
    NSMutableString *lettersToNumbersString = [[[NSMutableString alloc] init] autorelease];
    
    
    for (int i = 0; i<IBANString.length; i++) {
        NSString *number = [IBANString substringWithRange:TKNSRangeMake(i, 1)];
        if (![number isNumeric]) {
            number = [number TKNumberFromLetter];
        }
        [lettersToNumbersString appendFormat:@"%@",number];
        
    }
    
    NSString *firstHalf = [lettersToNumbersString substringToIndex:lettersToNumbersString.length/2];
    NSString *secondHalf = [lettersToNumbersString substringFromIndex:lettersToNumbersString.length/2];
    
    long long x1 = [firstHalf longLongValue];
    
    int y1 = x1 % 97;
    
    NSString *restAndSecondHalf = [NSString stringWithFormat:@"%d%@",y1, secondHalf];
    
    long long x2 = [restAndSecondHalf longLongValue];
    
    int y2 = x2 % 97;
    
    if (y2 == 1) {
        //is valid IBAN
        return YES;
    }
    else{
        // is not valid IBAN
        return NO;
    }
    
    
    
}

- (BOOL)isValidLuhnNumber{
    
    NSString *noSpacesStirng = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    noSpacesStirng = [noSpacesStirng stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    
    NSInteger sum = 0;
    BOOL alt = NO;
    for(int i = [noSpacesStirng length]-1; i >= 0; i--)
    {
        NSString *number = [noSpacesStirng substringWithRange:TKNSRangeMake(i, 1)];
        NSInteger temp = [number integerValue];
        if(alt)
        {  
            temp *= 2;
            if(temp > 9)
            {
                temp -= 9; //równoważne dodaniu cyfr do siebie np. 1+6 = 7, 16-9 = 7
            }
        }
        sum += temp;
        alt = !alt;
    }
    
    
    return sum % 10 == 0;
}

- (BOOL)isNumeric{
    BOOL isValid = NO;
    NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:self];
    isValid = [alphaNumbersSet isSupersetOfSet:stringSet];
    return isValid;
}

- (NSString *)TKNumberFromLetter{
    if      ([self isEqualToString:@"A"]) {
        return @"10";
    }
    else if ([self isEqualToString:@"B"]) {
        return @"11";
    }
    else if ([self isEqualToString:@"C"]) {
        return @"12";
    }
    else if ([self isEqualToString:@"D"]) {
        return @"13";
    }
    else if ([self isEqualToString:@"E"]) {
        return @"14";
    }
    else if ([self isEqualToString:@"F"]) {
        return @"15";
    }
    else if ([self isEqualToString:@"G"]) {
        return @"16";
    }
    else if ([self isEqualToString:@"H"]) {
        return @"17";
    }
    else if ([self isEqualToString:@"I"]) {
        return @"18";
    }
    else if ([self isEqualToString:@"J"]) {
        return @"19";
    }
    else if ([self isEqualToString:@"K"]) {
        return @"20";
    }
    else if ([self isEqualToString:@"L"]) {
        return @"21";
    }
    else if ([self isEqualToString:@"M"]) {
        return @"22";
    }
    else if ([self isEqualToString:@"N"]) {
        return @"23";
    }
    else if ([self isEqualToString:@"O"]) {
        return @"24";
    }
    else if ([self isEqualToString:@"P"]) {
        return @"25";
    }
    else if ([self isEqualToString:@"Q"]) {
        return @"26";
    }
    else if ([self isEqualToString:@"R"]) {
        return @"27";
    }
    else if ([self isEqualToString:@"S"]) {
        return @"28";
    }
    else if ([self isEqualToString:@"T"]) {
        return @"29";
    }
    else if ([self isEqualToString:@"U"]) {
        return @"30";
    }
    else if ([self isEqualToString:@"V"]) {
        return @"31";
    }
    else if ([self isEqualToString:@"W"]) {
        return @"32";
    }
    else if ([self isEqualToString:@"X"]) {
        return @"33";
    }
    else if ([self isEqualToString:@"Y"]) {
        return @"34";
    }
    else if ([self isEqualToString:@"Z"]) {
        return @"35";
    }
    else
        return nil;
}

- (NSInteger)sumWithWeights:(NSInteger *)weightsTable forNumericString:(NSString *)string{
    NSInteger sum = 0;
    
    for (int i = 0; i < [string length]; i++) {
        NSInteger number = [[string substringWithRange:TKNSRangeMake(i, 1)] integerValue];
        sum += number * weightsTable[i];
    }
    
    
    return sum;
}

@end

