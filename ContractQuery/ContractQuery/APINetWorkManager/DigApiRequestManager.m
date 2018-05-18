//
//  DigApiRequestManager.m
//  MoveVirtualCurrency
//
//  Created by zejie.wu on 2018/5/7.
//  Copyright © 2018年 Test. All rights reserved.
//
#import "DigApiRequestManager.h"


@implementation DigApiRequestManager


+ (void)requestLoginWithInfo:(NSDictionary *)userInfo header:(NSDictionary *)header resultCallback:(NetworkRequestCallback)resultCallback
{
    
    [[MCNetWorkRequestManager sharedManager] netWorkRequestWithType:HTTPResponseTypePOST
                                 requestURL:@"bqsims_client/factoringContractApi/appLogin.do"
                                     header:nil
                                 parameters:header
                             resultCallback:resultCallback];

}

+ (void)requestContracStateWithInfo:(NSDictionary *)userInfo header:(NSDictionary *)header resultCallback:(NetworkRequestCallback)resultCallback{
    
    [[MCNetWorkRequestManager sharedManager] netWorkRequestWithType:HTTPResponseTypePOST
                                 requestURL:@"bqsims_client/factoringContractApi/processList.do"
                                     header:header
                                 parameters:userInfo
                             resultCallback:resultCallback];

    
}

+ (void)requestPostStateWithInfo:(NSDictionary *)userInfo header:(NSDictionary *)header resultCallback:(NetworkRequestCallback)resultCallback{
    
    [[MCNetWorkRequestManager sharedManager] netWorkRequestWithType:HTTPResponseTypePOST
                                 requestURL:@"bqsims_client/factoringContractApi/changeReceiveInfo.do"
                                     header:header
                                 parameters:userInfo
                             resultCallback:resultCallback];

}

+ (void)requestQueryStateWithInfo:(NSDictionary *)userInfo header:(NSDictionary *)header resultCallback:(NetworkRequestCallback)resultCallback{
    
    [[MCNetWorkRequestManager sharedManager] netWorkRequestWithType:HTTPResponseTypePOST
                                 requestURL:@"bqsims_client/factoringContractApi/contractReceiveDetail.do"
                                     header:header
                                 parameters:userInfo
                             resultCallback:resultCallback];

    
}




@end
