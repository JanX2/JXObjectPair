//
//  JXObjectPair.h
//
//  Created by Jan on 12.06.12.
//  Copyright 2012 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#import <Foundation/Foundation.h>

#import "JXArcCompatibilityMacros.h"

@interface JXObjectPair : NSObject <NSCopying, NSCoding>

@property (nonatomic, readwrite, retain) id firstObject;
@property (nonatomic, readwrite, retain) id secondObject;

+ (id)pair;
+ (id)pairWithFirstObject:(id)anObject andSecondObject:(id)anotherObject;
- (id)initWithFirstObject:(id)anObject andSecondObject:(id)anotherObject;

@end
