//
//  NSString+RandomString.h
//  idap_1
//
//  Created by Yevhen Triukhan on 22.02.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RandomString)

+ (NSString*)randomStringWithLength:(NSUInteger)length;
+ (NSString*)randomString;
@end
