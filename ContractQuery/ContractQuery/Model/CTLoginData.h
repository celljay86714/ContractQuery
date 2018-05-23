//
//  CTLoginData.h
//  ContractQuery
//
//  Created by linyansen on 2018/5/22.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTLoginData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
