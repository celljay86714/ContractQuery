//
//  CTProtocolManagerDetailBaseClass.h
//  ContractQuery
//
//  Created by linyansen on 2018/5/22.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTProtocolManagerDetailBaseClass : NSObject

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *data;
@property (nonatomic, strong) NSString *code;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
@end
