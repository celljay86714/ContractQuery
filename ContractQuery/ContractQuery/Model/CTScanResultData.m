//
//  CTScanResultData.m
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "CTScanResultData.h"


NSString *const kCTScanResultDataLinkPhone = @"linkPhone";
NSString *const kCTScanResultDataUserName = @"userName";
NSString *const kCTScanResultDataRetailName = @"retailName";
NSString *const kCTScanResultDataContractNo = @"contractNo";
NSString *const kCTScanResultDataLinkman = @"linkman";
NSString *const kCTScanResultDataRetailCity = @"retailCity";
NSString *const kCTScanResultDataUpdateTms = @"updateTms";
NSString *const kCTScanResultDataProcess = @"process";


@interface CTScanResultData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CTScanResultData

@synthesize linkPhone = _linkPhone;
@synthesize userName = _userName;
@synthesize retailName = _retailName;
@synthesize contractNo = _contractNo;
@synthesize linkman = _linkman;
@synthesize retailCity = _retailCity;
@synthesize updateTms = _updateTms;
@synthesize process = _process;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.linkPhone = [self objectOrNilForKey:kCTScanResultDataLinkPhone fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kCTScanResultDataUserName fromDictionary:dict];
            self.retailName = [self objectOrNilForKey:kCTScanResultDataRetailName fromDictionary:dict];
            self.contractNo = [self objectOrNilForKey:kCTScanResultDataContractNo fromDictionary:dict];
            self.linkman = [self objectOrNilForKey:kCTScanResultDataLinkman fromDictionary:dict];
            self.retailCity = [self objectOrNilForKey:kCTScanResultDataRetailCity fromDictionary:dict];
            self.updateTms = [[self objectOrNilForKey:kCTScanResultDataUpdateTms fromDictionary:dict] doubleValue];
            self.process = [self objectOrNilForKey:kCTScanResultDataProcess fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.linkPhone forKey:kCTScanResultDataLinkPhone];
    [mutableDict setValue:self.userName forKey:kCTScanResultDataUserName];
    [mutableDict setValue:self.retailName forKey:kCTScanResultDataRetailName];
    [mutableDict setValue:self.contractNo forKey:kCTScanResultDataContractNo];
    [mutableDict setValue:self.linkman forKey:kCTScanResultDataLinkman];
    [mutableDict setValue:self.retailCity forKey:kCTScanResultDataRetailCity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updateTms] forKey:kCTScanResultDataUpdateTms];
    [mutableDict setValue:self.process forKey:kCTScanResultDataProcess];

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

    self.linkPhone = [aDecoder decodeObjectForKey:kCTScanResultDataLinkPhone];
    self.userName = [aDecoder decodeObjectForKey:kCTScanResultDataUserName];
    self.retailName = [aDecoder decodeObjectForKey:kCTScanResultDataRetailName];
    self.contractNo = [aDecoder decodeObjectForKey:kCTScanResultDataContractNo];
    self.linkman = [aDecoder decodeObjectForKey:kCTScanResultDataLinkman];
    self.retailCity = [aDecoder decodeObjectForKey:kCTScanResultDataRetailCity];
    self.updateTms = [aDecoder decodeDoubleForKey:kCTScanResultDataUpdateTms];
    self.process = [aDecoder decodeObjectForKey:kCTScanResultDataProcess];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_linkPhone forKey:kCTScanResultDataLinkPhone];
    [aCoder encodeObject:_userName forKey:kCTScanResultDataUserName];
    [aCoder encodeObject:_retailName forKey:kCTScanResultDataRetailName];
    [aCoder encodeObject:_contractNo forKey:kCTScanResultDataContractNo];
    [aCoder encodeObject:_linkman forKey:kCTScanResultDataLinkman];
    [aCoder encodeObject:_retailCity forKey:kCTScanResultDataRetailCity];
    [aCoder encodeDouble:_updateTms forKey:kCTScanResultDataUpdateTms];
    [aCoder encodeObject:_process forKey:kCTScanResultDataProcess];
}

- (id)copyWithZone:(NSZone *)zone {
    CTScanResultData *copy = [[CTScanResultData alloc] init];
    
    
    
    if (copy) {

        copy.linkPhone = [self.linkPhone copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.retailName = [self.retailName copyWithZone:zone];
        copy.contractNo = [self.contractNo copyWithZone:zone];
        copy.linkman = [self.linkman copyWithZone:zone];
        copy.retailCity = [self.retailCity copyWithZone:zone];
        copy.updateTms = self.updateTms;
        copy.process = [self.process copyWithZone:zone];
    }
    
    return copy;
}


@end
