//
//  CTStateListBaseClass.m
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "CTStateListBaseClass.h"
#import "CTStateListData.h"


NSString *const kCTStateListBaseClassMessage = @"message";
NSString *const kCTStateListBaseClassData = @"data";
NSString *const kCTStateListBaseClassCode = @"code";


@interface CTStateListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CTStateListBaseClass

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
            self.message = [self objectOrNilForKey:kCTStateListBaseClassMessage fromDictionary:dict];
    NSObject *receivedCTStateListData = [dict objectForKey:kCTStateListBaseClassData];
    NSMutableArray *parsedCTStateListData = [NSMutableArray array];
    
    if ([receivedCTStateListData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCTStateListData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCTStateListData addObject:[CTStateListData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCTStateListData isKindOfClass:[NSDictionary class]]) {
       [parsedCTStateListData addObject:[CTStateListData modelObjectWithDictionary:(NSDictionary *)receivedCTStateListData]];
    }

    self.data = [NSArray arrayWithArray:parsedCTStateListData];
            self.code = [self objectOrNilForKey:kCTStateListBaseClassCode fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kCTStateListBaseClassMessage];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.data) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kCTStateListBaseClassData];
    [mutableDict setValue:self.code forKey:kCTStateListBaseClassCode];

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

    self.message = [aDecoder decodeObjectForKey:kCTStateListBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kCTStateListBaseClassData];
    self.code = [aDecoder decodeObjectForKey:kCTStateListBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kCTStateListBaseClassMessage];
    [aCoder encodeObject:_data forKey:kCTStateListBaseClassData];
    [aCoder encodeObject:_code forKey:kCTStateListBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone {
    CTStateListBaseClass *copy = [[CTStateListBaseClass alloc] init];
    
    
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
    }
    
    return copy;
}


@end
