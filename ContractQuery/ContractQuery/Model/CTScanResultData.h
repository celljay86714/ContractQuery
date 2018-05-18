//
//  CTScanResultData.h
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CTScanResultData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *linkPhone;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *retailName;
@property (nonatomic, strong) NSString *contractNo;
@property (nonatomic, strong) NSString *linkman;
@property (nonatomic, strong) NSString *retailCity;
@property (nonatomic, assign) double updateTms;
@property (nonatomic, strong) NSString *process;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
