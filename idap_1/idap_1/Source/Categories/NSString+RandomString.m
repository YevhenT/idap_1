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
   
    char* tempUTF8String = malloc(sizeof(char) * (length + 1));
    
    tempUTF8String[0] = (char)(arc4random_uniform(25) + 65); //first sign from A to Z
    tempUTF8String[length + 1] = '\0';
    
    for (int i = 1; i < length; i++){
        tempUTF8String[i] = (char)(arc4random_uniform(25) + 97);
    }

    return [NSString stringWithUTF8String:tempUTF8String];
}

+ (NSString*)randomString{
    return [self randomStringWithLength:STRING_LENGTH];
}
@end
