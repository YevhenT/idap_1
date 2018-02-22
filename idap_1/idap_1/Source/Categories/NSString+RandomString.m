//
//  NSString+RandomString.m
//  idap_1
//
//  Created by Yevhen Triukhan on 22.02.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NSString+RandomString.h"

#define STRING_LENGTH 7

@implementation NSString (RandomString)

+ (NSString*)randomStringWithLength:(NSUInteger)length{
    NSMutableString *tempString = [NSMutableString new];

    for (int i = 0; i <= length; i++){
        char tempChar = (char)(arc4random_uniform(25) + 97);
        [tempString appendString:[NSString stringWithUTF8String:&tempChar]];
        if(i == 0) {
            tempString = [[tempString uppercaseString] mutableCopy];
        }
        
    }
    return [NSString stringWithString:tempString];
}

+ (NSString*)randomString{
    return [self randomStringWithLength:STRING_LENGTH];
}
@end
