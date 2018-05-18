//
//  MCNetWorkRequestManager.h
//  MoveVirtualCurrency
//
//  Created by zejie.wu on 2018/5/7.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HTTPResponseCode) {
    CODE_OK = 0,                                    // 成功
    CODE_FORBIDDEN = 1,                             // 禁止访问
    CODE_NOT_FOUND = 2,                             // 找不到
    CODE_TOKEN_EXPIRED = 101,                       // access token 过期
    CODE_INSECURE_TRANSPORT = 102,                  // 不安全的传输方式
    CODE_MISMATCHING_STATE = 103,                   // state 不匹配
    CODE_MISSING_CODE = 104,                        // code 缺失
    CODE_MISSING_TOKEN = 105,                       // token 缺失
    CODE_MISSING_TOKEN_TYPE = 106,                  // token 类型缺失
    CODE_INVALID_REDIRECT_URI = 107,                // 非法的 redirect_uri 值
    CODE_MISSING_REDIRECT_URI = 108,                // redirect_uri 缺失
    CODE_MISMATCHING_REDIRECT_URI = 109,            // redirect_uri 不匹配
    CODE_MISSING_CLIENT_ID = 110,                   // client_id 缺失
    CODE_INVALID_CLIENT_ID = 111,                   // client id 不合法
    CODE_ACCESS_DENIED = 112,                       // access_token 错误
    CODE_UNSUPPORTED_RESPONSE_TYPE = 113,           // response_type 填写错误
    CODE_INVALID_SCOPE = 114,                       // scope 不合法
    CODE_SERVER_ERROR = 115,                        // 服务器错误
    CODE_TEMPORARILY_UNAVAILABLE = 116,             // 服务器暂时不可用
    CODE_INVALID_CLIENT = 117,                      // client 不合法
    CODE_INVALID_GRANT = 118,                       // 无法授权
    CODE_UNAUTHORIZED_CLIENT = 119,                 // client 未验证
    CODE_UNSUPPORTED_GRANT_TYPE = 120,              // grant_type 填写错误
    CODE_UNSUPPORTED_TOKEN_TYPE = 121,              // token_type 填写错误
    CODE_INVALID_REQUEST = 122,                     // 请求有误
    CODE_TOKEN_INVALID = 123,                       // 非法token
    CODE_INVALID_REQUEST_DATA = 200,                // 请求数据有误
    CODE_MISSING_FIELD = 201,                       // 缺少字段
    CODE_INVALID_USERNAME_OR_PASSWORD = 210,        // 帐号或密码错误
    CODE_MOBILE_NUMBER_NOT_EXIST = 211,             // 手机号不存在
    CODE_MOBILE_NUMBER_EXIST = 212,                 // 手机号码已存在
    CODE_INVALID_CITY_ID = 213,                     // 无效的城市编码
    CODE_INVALID_MOBILE_NUMBER = 221,               // 无效手机号
    CODE_INVALID_SMS_CODE = 222,                    // 无效短信验证码
    CODE_INVALID_IDENTITY_ID = 227,                 // 无效身份证
    CODE_STAFF_ALREADY_WORKING = 228,               // 员工已经处于工作状态
    CODE_STAFF_NOT_WORKING = 229,                   // 员工没有处于工作状态
    CODE_IDENTITY_ID_EXIST = 234,                   // 身份证已存在
    CODE_SMS_INVALID_PHONE_NUMBER = 240,            // 无效手机号(短信运营商发的错误)
    CODE_SMS_SEND_TOO_MANY_TIMES_TO_ONE_USER = 241,     // 一天发送超过6次短信给一个手机号(短信运营商发的错误)
    CODE_SMS_OTHERS = 242,                              // 运营商发送的其他错误
    CODE_DATA_TOO_LONG = 243,                           // 数据太长
    CODE_DATA_TOO_SHORT = 244,                          // 数据太短
    CODE_UNEXPECTED_VALUE_TYPE = 202,                   // 数据类型不正确
    CODE_UNEXPECTED_VALUE_Permissions = 800,                //身份权限
    CODE_OTHER = 1000
};

typedef void (^NetworkRequestCallback)(BOOL success, NSDictionary *responseData, NSError *error);

typedef NS_ENUM(NSInteger, HTTPResponseType) {
    HTTPResponseTypeHEAD,
    HTTPResponseTypeGET,
    HTTPResponseTypePOST,
    HTTPResponseTypePUT,
    HTTPResponseTypeDELETE,
    HTTPResponseTypePATCH
};


@interface MCNetWorkRequestManager : NSObject

+ (MCNetWorkRequestManager *)sharedManager;


- (void)netWorkRequestWithType:(HTTPResponseType)requestType
                    requestURL:(NSString *)url
                        header:(NSDictionary *)header
                    parameters:(id)parameters
                resultCallback:(NetworkRequestCallback)resultCallback;

+ (NSDictionary *)getRequestHeaderWithAccessToken;


@end
