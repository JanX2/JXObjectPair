//
//  JXIndexedObjectPair.m
//
//  Created by Jan on 12.06.12.
//  Copyright 2012 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#import "JXIndexedObjectPair.h"

@implementation JXIndexedObjectPair {
	NSUInteger index;
}

@synthesize index;

+ (id)pairWithFirstObject:(id)anObject andSecondObject:(id)anotherObject index:(NSUInteger)theIndex;
{
	return JX_AUTORELEASE([[self alloc] initWithFirstObject:anObject andSecondObject:anotherObject index:theIndex]);
}

- (id)initWithFirstObject:(id)anObject andSecondObject:(id)anotherObject index:(NSUInteger)theIndex;
{
	self = [super initWithFirstObject:anObject andSecondObject:anotherObject];
	
	if (self) {
		index = theIndex;
	}
	
	return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder
{
	[super encodeWithCoder:encoder];
	[encoder encodeInteger:index forKey:@"index"];
}


- (id)initWithCoder:(NSCoder *)decoder
{
	self = [super initWithCoder:decoder];
	
	if (self) {
		index = [decoder decodeIntegerForKey:@"index"];
	}
	
	return self;
}


- (id)copyWithZone:(NSZone *)zone
{
	return [[JXIndexedObjectPair allocWithZone:zone] initWithFirstObject:self.firstObject andSecondObject:self.secondObject index:index];
}


- (NSString *)description
{
	return [NSString stringWithFormat:@"%lu: %@", (unsigned long)index, [super description]];
}


- (NSUInteger)hash
{
	return [super hash] ^ index;
}


- (BOOL)isEqual:(id)otherObject
{
	if ([otherObject isKindOfClass:[JXIndexedObjectPair class]] == NO) {
		return NO;
	}
	
	if ([super isEqual:otherObject] == NO) {
		return NO;
	}
	
	JXIndexedObjectPair *otherIndexedPair = (JXIndexedObjectPair *)otherObject;
	
	return (index == otherIndexedPair.index);
}

@end
