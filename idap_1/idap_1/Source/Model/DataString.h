//
//  DataString.h
//  idap_1
//
//  Created by Yevhen Triukhan on 21.02.18.
//  Copyright © 2018 Yevhen Triukhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataString : NSObject

@property (assign, nonatomic, readonly) NSUInteger count;

+ (DataString*) sharedData;

- (instancetype) init;
- (instancetype) initWithCapacity:(NSUInteger)numItems NS_DESIGNATED_INITIALIZER;
- (instancetype) initWithContentsOfFile:(NSString *)path;

- (NSDictionary*) objectAtIndex:(NSUInteger)index;
- (void) addObject:(id)anObject; //incoming object will be ignored and replaced with random data
- (void) removeObjectAtIndex:(NSUInteger)index;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

- (void) saveData;
- (DataString*) loadData;
@end
