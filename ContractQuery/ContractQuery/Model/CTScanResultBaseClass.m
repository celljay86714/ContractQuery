//
//  CTScanResultBaseClass.m
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "CTScanResultBaseClass.h"
#import "CTScanResultData.h"


NSString *const kCTScanResultBaseClassMessage = @"message";
NSString *const kCTScanResultBaseClassData = @"data";
NSString *const kCTScanResultBaseClassCode = @"code";


@interface CTScanResultBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CTScanResultBaseClass

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
            self.message = [self objectOrNilForKey:kCTScanResultBaseClassMessage fromDictionary:dict];
            self.data = [CTScanResultData modelObjectWithDictionary:[dict objectForKey:kCTScanResultBaseClassData]];
            self.code = [self objectOrNilForKey:kCTScanResultBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kCTScanResultBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kCTScanResultBaseClassData];
    [mutableDict setValue:self.code forKey:kCTScanResultBaseClassCode];

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

    self.message = [aDecoder decodeObjectForKey:kCTScanResultBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kCTScanResultBaseClassData];
    self.code = [aDecoder decodeObjectForKey:kCTScanResultBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kCTScanResultBaseClassMessage];
    [aCoder encodeObject:_data forKey:kCTScanResultBaseClassData];
    [aCoder encodeObject:_code forKey:kCTScanResultBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    CTScanResultBaseClass *copy = [[CTScanResultBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
