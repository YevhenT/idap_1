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

static NSString* dataFilePath();

static NSString * kFirstName = @"firstName";
static NSString * kLastName = @"lastName";
static NSString * kBirthday = @"birthday";
static NSString * kImage = @"imageName";


@interface DataString ()
@property (strong, nonatomic) NSMutableArray<NSDictionary*> *strings;
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
    return [self initWithCapacity:0];
}

- (instancetype) initWithCapacity:(NSUInteger)numItems {
    if(self = [super init]){
        if(numItems != 0){
            _strings = [[NSMutableArray alloc] initWithCapacity:numItems];
            for (int idx = 0; idx < numItems; idx++){
                _strings[idx] =  [self randomStringsAndDate];
            }
        } else {
            _strings = [NSMutableArray array];
        }
    }

    return self;
}

- (instancetype)initWithContentsOfFile:(NSString *)path{
    self = [self initWithCapacity:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if ([fileManager fileExistsAtPath: path] == YES){
        if (self){
            _strings = [[[NSArray alloc] initWithContentsOfFile:path] mutableCopy];
        }
    }
    return self;
}
#pragma mark -
#pragma mark Accessors
- (NSUInteger) count {
    return _strings.count;
}


#pragma mark -
#pragma mark Public API

- (NSDictionary*) objectAtIndex:(NSUInteger)index{
    return [self.strings objectAtIndex:index];
}

- (void) addObject:(id)anObject{ //incoming object will be ignored and replaced with random data
    [self.strings insertObject:[self randomStringsAndDate] atIndex:0];
}

- (void) removeObjectAtIndex:(NSUInteger)index{
    [self.strings removeObjectAtIndex:index];
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2{
    NSDictionary *tempDictionary = self.strings[idx1];
    [self.strings replaceObjectAtIndex:idx1 withObject:self.strings[idx2]];
    [self.strings replaceObjectAtIndex:idx2 withObject:tempDictionary];
}

- (void) saveData{
    [self.strings writeToFile:dataFilePath() atomically:YES];
}
- (DataString*) loadData{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath: dataFilePath()] == YES){
        self.strings = [[NSMutableArray alloc] initWithContentsOfFile:dataFilePath()];
    } else {
        self.strings = [NSMutableArray arrayWithObject:[self randomStringsAndDate]];
    }
    return self;
}








#pragma mark -
#pragma mark Private API

-(NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale currentLocale];
    [dateFormatter setDateFormat:@"d MMM yyyy, HH:mm:ss:SSS"];
    NSString *stringFromDate = [dateFormatter stringFromDate:date];
    return stringFromDate;
}

- (NSDictionary*) randomStringsAndDate{
    return @{ kFirstName : [NSString randomString],
              kLastName : [NSString randomString],
              kBirthday : [self stringFromDate:[NSDate date]],
              kImage : @"anonymous_240"
              };
}

@end

static NSString* dataFilePath(){
    NSString *docFolderPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *fileName = @"/data.txt";
    NSString *filePath = [docFolderPath stringByAppendingString:fileName];
    return filePath;
}
