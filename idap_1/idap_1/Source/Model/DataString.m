//
//  DataString.m
//  idap_1
//
//  Created by Yevhen Triukhan on 21.02.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import "NSString+RandomString.h"

#import "DataString.h"

static NSString * kFirstName = @"firstName";
static NSString * kLastName = @"lastName";
static NSString * kBirthday = @"birthday";


@interface DataString ()
@property (strong, nonatomic) NSMutableArray *strings;
@end

@implementation DataString

#pragma mark -
#pragma mark Initialization and Deallocation
- (instancetype) init{
    if(self = [super init]){
        if(_strings.count == 0){
            _strings = [ @[ @{ kFirstName : [NSString randomString],
                               kLastName : @"b1",
                               kBirthday : @"111"
                             },
                            @{ kFirstName : @"a2",
                               kLastName : @"b2",
                               kBirthday : @"222"
                             }
                          ] mutableCopy];
        }
    }
    return self;
}

#pragma mark -
#pragma mark Accessors
- (NSUInteger) count {
    return _strings.count;
}

- (id) objectAtIndex:(NSUInteger)index{
    return _strings[index];
}
@end
