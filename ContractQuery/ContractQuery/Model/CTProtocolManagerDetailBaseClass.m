//
//  CTProtocolManagerDetailBaseClass.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/22.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTProtocolManagerDetailBaseClass.h"

NSString *const kCTProtocolManagerDetailBaseClassMessage = @"message";
NSString *const kCTProtocolManagerDetailBaseClassData = @"data";
NSString *const kCTProtocolManagerDetailBaseClassCode = @"code";

@interface CTProtocolManagerDetailBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CTProtocolManagerDetailBaseClass

@synthesize message = _message;
@synthesize data = _data;
@synthesize code = _code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.message = [self objectOrNilForKey:kCTProtocolManagerDetailBaseClassMessage fromDictionary:dict];
        self.data = [self objectOrNilForKey:kCTProtocolManagerDetailBaseClassData fromDictionary:dict];
        self.code = [self objectOrNilForKey:kCTProtocolManagerDetailBaseClassCode fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kCTProtocolManagerDetailBaseClassMessage];
    [mutableDict setValue:self.data forKey:kCTProtocolManagerDetailBaseClassData];
    [mutableDict setValue:self.code forKey:kCTProtocolManagerDetailBaseClassCode];
    
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
    
    self.message = [aDecoder decodeObjectForKey:kCTProtocolManagerDetailBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kCTProtocolManagerDetailBaseClassData];
    self.code = [aDecoder decodeObjectForKey:kCTProtocolManagerDetailBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_message forKey:kCTProtocolManagerDetailBaseClassMessage];
    [aCoder encodeObject:_data forKey:kCTProtocolManagerDetailBaseClassData];
    [aCoder encodeObject:_code forKey:kCTProtocolManagerDetailBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    CTProtocolManagerDetailBaseClass *copy = [[CTProtocolManagerDetailBaseClass alloc] init];
    
    
    
    if (copy) {
        
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}

@end
