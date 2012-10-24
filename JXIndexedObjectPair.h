//
//  JXIndexedObjectPair.h
//
//  Created by Jan on 12.06.12.
//  Copyright 2012 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#import "JXObjectPair.h"

@interface JXIndexedObjectPair : JXObjectPair

@property (nonatomic, readwrite) NSUInteger index;

+ (id)pairWithFirstObject:(id)anObject andSecondObject:(id)anotherObject index:(NSUInteger)theIndex;
- (id)initWithFirstObject:(id)anObject andSecondObject:(id)anotherObject index:(NSUInteger)theIndex;

@end
