//
//  CTUserManager.h
//  ContractQuery
//
//  Created by linyansen on 2018/5/22.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTUserManager : NSObject


+ (CTUserManager *)sharedInstance;

@property (nonatomic, strong) NSString *userId;//用户账号
@property (nonatomic, strong) NSString *userName;//用户名称
@end
