//
//  MCNetWorkRequestManager.m
//  MoveVirtualCurrency
//
//  Created by zejie.wu on 2018/5/7.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "MCNetWorkRequestManager.h"

@implementation MCNetWorkRequestManager

+ (MCNetWorkRequestManager *)sharedManager {
    static MCNetWorkRequestManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
    
    
}


#pragma mark - Create AFHTTPRequestOperationManager

- (AFHTTPSessionManager *)creatAFHTTPRequestOperationManagerWithHeader:(NSDictionary *)header removeNullValues:(BOOL)remove {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    if (header) {
        NSArray *allkeys = [header allKeys];
        for (NSString *key in allkeys) {
            [manager.requestSerializer setValue:header[key] forHTTPHeaderField:key];
        }
    }
    
    [manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"X-Platform"];
    [manager.requestSerializer setValue:[NSBundle mainBundle].infoDictionary[@"ServerAPIVersion"] forHTTPHeaderField:@"X-API-Version"];
    // 权限字段
    [manager.requestSerializer setTimeoutInterval:10];
    
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = remove;
    manager.responseSerializer = responseSerializer;
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    return manager;
}


- (void)netWorkRequestWithType:(HTTPResponseType)requestType
                    requestURL:(NSString *)requestURL
                        header:(NSDictionary *)header
                    parameters:(id)parameters
                resultCallback:(NetworkRequestCallback)resultCallback {
    
    AFHTTPSessionManager *manager = [self creatAFHTTPRequestOperationManagerWithHeader:header removeNullValues:YES];
    
    requestURL = [NSString stringWithFormat:@"%@%@", CurrentAPIHost, requestURL];
    NSLog(@"----REQUEST URL----[%@]", requestURL);
    NSLog(@"----REQUEST HEADER----[%@]", header);
    NSLog(@"----REQUEST PARAMETERS----[%@]", parameters);
    
    switch (requestType) {
        
        case HTTPResponseTypeGET:
        {
            
            [manager GET:requestURL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSLog(@"----GET SUCCESS WITH RESPONSE----[%@]", responseObject);
                if ([responseObject[@"code"] integerValue] == CODE_OK) {
                    resultCallback ? resultCallback(YES, responseObject, nil) : nil;
                } else {
                    resultCallback ? resultCallback(NO, responseObject, responseObject) : nil;
                }

                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                NSLog(@"----GET FAILED WITH ERROR----[%@]", [error localizedDescription]);
                resultCallback ? resultCallback(NO, nil, error) : nil;
                
            }];
            
            break;
        }
        case HTTPResponseTypePOST:
        {
            
            [manager POST:requestURL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"----POST SUCCESS WITH RESPONSE----[%@]", responseObject);
                if ([responseObject[@"code"] integerValue] == CODE_OK) {
                    resultCallback ? resultCallback(YES, responseObject, nil) : nil;
                } else {
                    resultCallback ? resultCallback(NO, responseObject, responseObject) : nil;
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"----POST FAILED WITH ERROR----[%@]", [error localizedDescription]);
                resultCallback ? resultCallback(NO, nil, error) : nil;
                
            }];
            break;
        }
        default:
            break;
    }
}

+ (NSDictionary *)getRequestHeaderWithAccessToken {
    NSDictionary *tokens = [[NSUserDefaults standardUserDefaults] objectForKey:@"TOken"];
    if (tokens == nil) {
        return nil;
    }
    
    return @{@"Authorization":[NSString stringWithFormat:@"%@ %@", tokens[@"token_type"], tokens[@"access_token"]]};
}

- (NSDictionary *)errorResponseWithData:(NSData *)data {
    if (data == nil) {
        return nil;
    }
    
    NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"----GET FAILURE INFORMATION WITH RESPONSE DATA----[%@]", responseData);
    return responseData;
}

- (void)statusWithErrorResponseData:(NSData *)data {
    
    NSDictionary *responseData = [self errorResponseWithData:data];
    if (responseData == nil) {
        return;
    }
    HTTPResponseCode responseCode = [responseData[@"code"] integerValue];
    
    if ((responseCode == CODE_TOKEN_INVALID || responseCode == CODE_TOKEN_EXPIRED)) {
    }
    
    if (responseCode == CODE_UNEXPECTED_VALUE_Permissions) {
        
        
    }
}


@end
