//
//  DigApiRequestManager.m
//  MoveVirtualCurrency
//
//  Created by zejie.wu on 2018/5/7.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "DigApiRequestManager.h"

@interface DigApiRequestManager()

@property (strong, nonatomic) MCNetWorkRequestManager *networkManager;

@end

@implementation DigApiRequestManager

+ (DigApiRequestManager *)sharedManager {
    static DigApiRequestManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        sharedManager.networkManager = [MCNetWorkRequestManager sharedManager];
    });
    
    return sharedManager;
}

- (void)registerAsNewWithInfo:(NSDictionary *)userInfo resultCallback:(NetworkRequestCallback)resultCallback{
    
    [_networkManager netWorkRequestWithType:HTTPResponseTypeGET
                                 requestURL:@"bqjr_hcms_web/notice/noticeBanner?company=BQJR"
                                     header:nil
                                 parameters:userInfo
                             resultCallback:resultCallback];

}

@end
