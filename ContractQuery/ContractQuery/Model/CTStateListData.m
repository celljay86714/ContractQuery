//
//  CTStateListData.m
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "CTStateListData.h"


NSString *const kCTStateListDataProcessId = @"processId";
NSString *const kCTStateListDataProcessName = @"processName";


@interface CTStateListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CTStateListData

@synthesize processId = _processId;
@synthesize processName = _processName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.processId = [self objectOrNilForKey:kCTStateListDataProcessId fromDictionary:dict];
            self.processName = [self objectOrNilForKey:kCTStateListDataProcessName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.processId forKey:kCTStateListDataProcessId];
    [mutableDict setValue:self.processName forKey:kCTStateListDataProcessName];

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

    self.processId = [aDecoder decodeObjectForKey:kCTStateListDataProcessId];
    self.processName = [aDecoder decodeObjectForKey:kCTStateListDataProcessName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_processId forKey:kCTStateListDataProcessId];
    [aCoder encodeObject:_processName forKey:kCTStateListDataProcessName];
}

- (id)copyWithZone:(NSZone *)zone {
    CTStateListData *copy = [[CTStateListData alloc] init];
    
    
    
    if (copy) {

        copy.processId = [self.processId copyWithZone:zone];
        copy.processName = [self.processName copyWithZone:zone];
    }
    
    return copy;
}


@end
