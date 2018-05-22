//
//  CTLoginBaseClass.m
//  ContractQuery
//
//  Created by linyansen on 2018/5/22.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "CTLoginBaseClass.h"
#import "CTLoginData.h"

NSString *const kCTLoginBaseClassMessage = @"message";
NSString *const kCTLoginBaseClassData = @"data";
NSString *const kCTLoginBaseClassCode = @"code";


@interface CTLoginBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CTLoginBaseClass


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
        self.message = [self objectOrNilForKey:kCTLoginBaseClassMessage fromDictionary:dict];
        self.data = [CTLoginData modelObjectWithDictionary:[dict objectForKey:kCTLoginBaseClassData]];
        self.code = [self objectOrNilForKey:kCTLoginBaseClassCode fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kCTLoginBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kCTLoginBaseClassData];
    [mutableDict setValue:self.code forKey:kCTLoginBaseClassCode];
    
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
    
    self.message = [aDecoder decodeObjectForKey:kCTLoginBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kCTLoginBaseClassData];
    self.code = [aDecoder decodeObjectForKey:kCTLoginBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_message forKey:kCTLoginBaseClassMessage];
    [aCoder encodeObject:_data forKey:kCTLoginBaseClassData];
    [aCoder encodeObject:_code forKey:kCTLoginBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    CTLoginBaseClass *copy = [[CTLoginBaseClass alloc] init];
    
    
    
    if (copy) {
        
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}
@end
