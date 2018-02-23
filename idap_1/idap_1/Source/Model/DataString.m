//
//  DataString.m
//  idap_1
//
//  Created by Yevhen Triukhan on 21.02.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//
#import <UIKit/UIImage.h>

#import "NSString+RandomString.h"

#import "DataString.h"

static NSString * kFirstName = @"firstName";
static NSString * kLastName = @"lastName";
static NSString * kBirthday = @"birthday";
static NSString * kImage = @"imageData";


@interface DataString ()
@property (strong, nonatomic) NSMutableArray *strings;
@end

@implementation DataString

#pragma mark -
#pragma mark Initialization and Deallocation

+ (DataString*) sharedData{
    static DataString *dataStrings = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (dataStrings == nil) {
            dataStrings = [[DataString alloc] init];
        }
    });
    
    return dataStrings;
}


- (instancetype) init{
    if(self = [super init]){
        if(_strings.count == 0){
            _strings = [ @[ @{ kFirstName : [NSString randomString],
                               kLastName : [NSString randomString],
                               kBirthday : [self stringFromDate:[NSDate date]],
                               kImage : [NSData dataWithContentsOfFile:
                                         [[NSBundle mainBundle] pathForResource:@"anonymous_240"
                                                                         ofType:@"png"]]//[UIImage imageNamed:@"anonymous_240"]
                             },
                            @{ kFirstName : [NSString randomString],
                               kLastName : [NSString randomString],
                               kBirthday : [self stringFromDate:[NSDate date]],
                               kImage : [NSData dataWithContentsOfFile:
                                         [[NSBundle mainBundle] pathForResource:@"anonymous_240"
                                                                         ofType:@"png"]]//[UIImage imageNamed:@"anonymous_240"]
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

#pragma mark -
#pragma mark Public API
- (void)saveAllStrings{
    ;
}

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
