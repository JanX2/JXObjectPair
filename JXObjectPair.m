//
//  JXObjectPair.m
//
//  Created by Jan on 12.06.12.
//  Copyright 2012 Jan Weiß. Some rights reserved: <http://opensource.org/licenses/BSD-3-Clause>
//

#import "JXObjectPair.h"

@implementation JXObjectPair {
	id firstObject;
	id secondObject;
}

@synthesize firstObject;
@synthesize secondObject;


+ (id)pair;
{
	return [[[self alloc] init] autorelease];
}

+ (id)pairWithFirstObject:(id)anObject andSecondObject:(id)anotherObject;
{
	return [[[self alloc] initWithFirstObject:anObject andSecondObject:anotherObject] autorelease];
}

- (id)initWithFirstObject:(id)anObject andSecondObject:(id)anotherObject;
{
	self = [super init];
	
	if (self) {
		firstObject = [anObject retain];
		secondObject = [anotherObject retain];
	}
	
	return self;
}


- (void)dealloc
{
	self.firstObject = nil;
	self.secondObject = nil;
	
	[super dealloc];
}


- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:firstObject forKey:@"firstObject"];
	[encoder encodeObject:secondObject forKey:@"secondObject"];
}


- (id)initWithCoder:(NSCoder *)decoder
{
	self = [super init];

	if (self) {
		self.firstObject = [decoder decodeObjectForKey:@"firstObject"];
		self.secondObject = [decoder decodeObjectForKey:@"secondObject"];
	}
	
	return self;
}


- (id)copyWithZone:(NSZone *)zone
{
	return [[JXObjectPair allocWithZone:zone] initWithFirstObject:firstObject andSecondObject:secondObject];
}


- (NSString *)description
{
	NSString *firstObjectDescription = [firstObject description];
	NSString *secondObjectDescription = [secondObject description];
	return [NSString stringWithFormat:@"('%@', '%@')", firstObjectDescription, secondObjectDescription];
}


- (NSUInteger)hash
{
	return [firstObject hash] ^ [secondObject hash];
}


- (BOOL)isEqual:(id)otherObject
{
	if (otherObject == nil) {
		return NO;
	}
	
	if ([otherObject isKindOfClass:[JXObjectPair class]] == NO) {
		return NO;
	}
	
	JXObjectPair *otherPair = (JXObjectPair *)otherObject;
	
	id otherFirstObject = otherPair.firstObject;
	id otherSecondObject = otherPair.secondObject;
	
	BOOL firstObjectsEqual = (((firstObject == nil) && (otherFirstObject == nil)) || [firstObject isEqual:otherFirstObject]);
	BOOL secondObjectsEqual = (((secondObject == nil) && (otherSecondObject == nil)) || [secondObject isEqual:otherSecondObject]);
	
	return (firstObjectsEqual && secondObjectsEqual);
}


@end
