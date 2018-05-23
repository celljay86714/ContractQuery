//
//  CTLoginData.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/22.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTLoginData.h"

NSString *const kCTLoginDataUserId = @"userId";
NSString *const kCTLoginDataUserName = @"userName";


@interface CTLoginData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CTLoginData


@synthesize userId = _userId;
@synthesize userName = _userName;



+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.userId = [self objectOrNilForKey:kCTLoginDataUserId fromDictionary:dict];
        self.userName = [self objectOrNilForKey:kCTLoginDataUserName fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userId forKey:kCTLoginDataUserId];
    [mutableDict setValue:self.userName forKey:kCTLoginDataUserName];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.userId = [aDecoder decodeObjectForKey:kCTLoginDataUserId];
    self.userName = [aDecoder decodeObjectForKey:kCTLoginDataUserName];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_userId forKey:kCTLoginDataUserId];
    [aCoder encodeObject:_userName forKey:kCTLoginDataUserName];

}

- (id)copyWithZone:(NSZone *)zone {
    CTLoginData *copy = [[CTLoginData alloc] init];
    
    
    
    if (copy) {
        
        copy.userId = [self.userId copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];

    }
    
    return copy;
}

@end
