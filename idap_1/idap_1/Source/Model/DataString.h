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

- (id) objectAtIndex:(NSUInteger)index;
@end
