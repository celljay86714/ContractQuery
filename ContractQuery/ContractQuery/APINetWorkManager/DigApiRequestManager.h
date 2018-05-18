//
//  DigApiRequestManager.h
//  MoveVirtualCurrency
//
//  Created by zejie.wu on 2018/5/7.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DigApiRequestManager : NSObject

//登录
+ (void)requestLoginWithInfo:(NSDictionary *)userInfo header:(NSDictionary *)header resultCallback:(NetworkRequestCallback)resultCallback;

//获取状态
+ (void)requestContracStateWithInfo:(NSDictionary *)userInfo header:(NSDictionary *)header resultCallback:(NetworkRequestCallback)resultCallback;

//上传状态
+ (void)requestPostStateWithInfo:(NSDictionary *)userInfo header:(NSDictionary *)header resultCallback:(NetworkRequestCallback)resultCallback;

//查询商户
+ (void)requestQueryStateWithInfo:(NSDictionary *)userInfo header:(NSDictionary *)header resultCallback:(NetworkRequestCallback)resultCallback;


@end
