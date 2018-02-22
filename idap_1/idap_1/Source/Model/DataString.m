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
                               kLastName : [NSString randomString],
                               kBirthday : [self stringFromDate:[NSDate date]]
                             },
                            @{ kFirstName : [NSString randomString],
                               kLastName : [NSString randomString],
                               kBirthday : [self stringFromDate:[NSDate date]]
                             }
                          ] mutableCopy];
        }
    }
//    [self stringFromDate:[NSDate date]];
//    NSDate *today = [NSDate date];
//    NSString *todayString = [[self dateFormatter] stringFromDate:today];
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

#pragma mark -
#pragma mark Public API

#pragma mark -
#pragma mark Private API

-(NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:@"d MMM yyyy, HH:mm:ss"];
    NSString *stringFromDate = [dateFormatter stringFromDate:date];
    return stringFromDate;
}

@end
