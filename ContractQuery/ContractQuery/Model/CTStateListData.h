//
//  CTStateListData.h
//
//  Created by   on 2018/5/18
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CTStateListData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *processId;
@property (nonatomic, strong) NSString *processName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
